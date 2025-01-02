use starknet::ContractAddress;

#[starknet::interface] // 使用宏 `#[starknet::interface]` 标明以下 `trait` 是一个 ABI 接口
// `TContractState` 是一个泛型参数，一般使用 `TContractState` 或 `TCS`
trait IERC20<TContractState> {
    // 使用了快照类型，这代表 `name` 函数不会修改当前智能合约的状态空间，
    // 简单来说，就是当前函数不会写入任何数据，
    // 类似 solidity 中的 `view` 或 `pure` 函数。
    // 为兼容主网版本，这里依旧使用了 `felt252` 作为字符串返回
    fn name(self: @TContractState) -> felt252;
    fn symbol(self: @TContractState) -> felt252;
    fn decimals(self: @TContractState) -> u8;
    fn totalSupply(self: @TContractState) -> u256;
    fn balanceOf(self: @TContractState, account: ContractAddress) -> u256;
    fn allowance(self: @TContractState, owner: ContractAddress, spender: ContractAddress) -> u256;
    // 我们在 `self` 前增加了 `ref` 标识，此标识代表该函数可以修改当前合约状态。
    fn transfer(ref self: TContractState, to: ContractAddress, amount: u256) -> bool;
    fn transferFrom(
        ref self: TContractState, from: ContractAddress, to: ContractAddress, amount: u256
    ) -> bool;
    fn approve(ref self: TContractState, spender: ContractAddress, amount: u256) -> bool;
    fn mint(ref self: TContractState, amount: u256);
}


#[starknet::contract]
mod ERC20 {
    use starknet::ContractAddress;
    use starknet::get_caller_address;
    use core::integer::BoundedInt;

    // 结构体作为映射的键需要派生 Hsah 宏  作为映射中的值需要派生 starknet::Store 宏
    #[derive(starknet::Store, Hash, Drop)]
    struct test {
        name: felt252,
        symbol: felt252,
    }

    #[storage]
    struct Storage {
        _name: felt252,
        _symbol: felt252,
        _decimals: u8,
        _total_supply: u256,
        _balances: LegacyMap::<ContractAddress, u256>,
        // 使用 `(ContractAddress, ContractAddress)` 两个地址作为键来检索用户的授权额度
        _allowances: LegacyMap::<(ContractAddress, ContractAddress), u256>,
        _test: LegacyMap::<test, test>
    }

    #[event]
    #[derive(Drop, PartialEq, starknet::Event)]
    enum Event {
        Transfer: Transfer,
        Approval: Approval,
    }


    #[derive(Drop, PartialEq, starknet::Event)]
    struct Transfer {
        #[key] // index
        from: ContractAddress,
        #[key]
        to: ContractAddress,
        value: u256,
    }


    #[derive(Drop, PartialEq, starknet::Event)]
    struct Approval {
        #[key]
        owner: ContractAddress,
        #[key]
        spender: ContractAddress,
        value: u256,
    }

    #[constructor]
    fn constructor(ref self: ContractState, name: felt252, symbol: felt252, decimals: u8) {
        self._name.write(name);
        self._symbol.write(symbol);
        self._decimals.write(decimals);
    }

    #[external(v0)]
    impl IERC20Impl of super::IERC20<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            self._name.read()
        }


        fn symbol(self: @ContractState) -> felt252 {
            self._symbol.read()
        }

        fn decimals(self: @ContractState) -> u8 {
            self._decimals.read()
        }

        fn totalSupply(self: @ContractState) -> u256 {
            self._total_supply.read()
        }

        fn balanceOf(self: @ContractState, account: ContractAddress) -> u256 {
            self._balances.read(account)
        }

        // `allowance` 是使用元组作为键的，允许我们使用多个键查询某一个值。
        fn allowance(
            self: @ContractState, owner: ContractAddress, spender: ContractAddress
        ) -> u256 {
            self._allowances.read((owner, spender))
        }

        fn mint(ref self: ContractState, amount: u256) {
            let sender = get_caller_address();
            self._total_supply.write(self._total_supply.read() + amount);
            self._balances.write(sender, self._balances.read(sender) + amount);
            self
                .emit(
                    Event::Transfer(
                        Transfer { from: core::Zeroable::zero(), to: sender, value: amount }
                    )
                );
        }

        fn approve(ref self: ContractState, spender: ContractAddress, amount: u256) -> bool {
            // msg.sender
            let owner = get_caller_address();
            self._allowances.write((owner, spender), amount);
            self.emit(Event::Approval(Approval { owner, spender, value: amount }));

            true
        }


        fn transfer(ref self: ContractState, to: ContractAddress, amount: u256) -> bool {
            let from = get_caller_address();
            // self._balances.write(from, self._balances.read(from) - amount);
            // self._balances.write(to, self._balances.read(to) + amount);
            // self.emit(Event::Transfer(Transfer { from, to, value: amount }));

            self.transfer_helper(from, to, amount);
            true
        }
        fn transferFrom(
            ref self: ContractState, from: ContractAddress, to: ContractAddress, amount: u256
        ) -> bool {
            let caller = get_caller_address();
            let allowed = self._allowances.read((from, caller));

            if (allowed != BoundedInt::max()) {
                self._allowances.write((from, caller), allowed - amount);
                self
                    .emit(
                        Event::Approval(
                            Approval { owner: from, spender: caller, value: allowed - amount }
                        )
                    );
            }

            // self._balances.write(from, self._balances.read(from) - amount);
            // self._balances.write(to, self._balances.read(to) + amount);
            // self.emit(Event::Transfer(Transfer { from, to, value: amount }));

            self.transfer_helper(from, to, amount);

            true
        }
    }

    #[generate_trait]
    impl StorageImpl of StorageTrait {
        fn transfer_helper(
            ref self: ContractState,
            sender: ContractAddress,
            recipient: ContractAddress,
            amount: u256
        ) {
            self._balances.write(sender, self._balances.read(sender) - amount);
            self._balances.write(recipient, self._balances.read(recipient) + amount);
            self.emit(Event::Transfer(Transfer { from: sender, to: recipient, value: amount }));
        }
    }
}

