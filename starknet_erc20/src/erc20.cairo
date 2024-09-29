use starknet::ContractAddress;

#[starknet::interface]
pub trait IERC20<TContractState> {
    fn get_name(self: @TContractState) -> ByteArray;
    fn get_symbol(self: @TContractState) -> ByteArray;
    fn get_decimals(self: @TContractState) -> u8;
    fn get_total_supply(self: @TContractState) -> u256;
    fn balance_of(self: @TContractState, account: ContractAddress) -> u256;
    fn allowance(self: @TContractState, owner: ContractAddress, spender: ContractAddress) -> u256;
    fn transfer(ref self: TContractState, recipient: ContractAddress, amount: u256);
    fn transfer_from(
        ref self: TContractState, sender: ContractAddress, recipient: ContractAddress, amount: u256
    );
    fn approve(ref self: TContractState, spender: ContractAddress, amount: u256);
    fn increase_allowance(ref self: TContractState, spender: ContractAddress, added_value: u256);
    fn decrease_allowance(
        ref self: TContractState, spender: ContractAddress, subtracted_value: u256
    );
    fn mint(ref self: TContractState, recipient: ContractAddress, amount: u256);
}

#[starknet::contract]
mod ERC20 {
    use core::num::traits::Zero;
    use starknet::{get_caller_address, contract_address_const};
    use starknet::event::EventEmitter;
    use starknet::storage::{Map, StorageMapReadAccess, StorageMapWriteAccess};
    use super::IERC20;
    use super::ContractAddress;

    const TOTAL_SUPPLY: u256 = 100_000_000;

    #[storage]
    struct Storage {
        //name of the token
        name: ByteArray,
        //token symbol
        symbol: ByteArray,
        //token decimals e.g 18
        decimals: u8,
        //token max supply
        total_supply: u256,
        //balances of each user
        balances: Map::<ContractAddress, u256>,
        // allownaces for third party contracts
        allowances: Map::<(ContractAddress, ContractAddress), u256>,
    }

    mod Errors {
        pub const APPROVE_FROM_ZERO: felt252 = 'ERC20: approve from 0';
        pub const APPROVE_TO_ZERO: felt252 = 'ERC20: approve to 0';
        pub const TRANSFER_FROM_ZERO: felt252 = 'ERC20: transfer from 0';
        pub const TRANSFER_TO_ZERO: felt252 = 'ERC20: transfer to 0';
        pub const BURN_FROM_ZERO: felt252 = 'ERC20: burn from 0';
        pub const MINT_TO_ZERO: felt252 = 'ERC20: mint to 0';
    }

    #[constructor]
    fn constructor(ref self: ContractState, name: ByteArray, symbol: ByteArray) {
        self.name.write(name);
        self.symbol.write(symbol);
        self.total_supply.write(TOTAL_SUPPLY);
    }
    #[event]
    #[derive(Drop, starknet::Event)]
    pub enum Event {
        Transfer: Transfer,
        Approval: Approval,
    }
    #[derive(Drop, starknet::Event)]
    pub struct Transfer {
        pub from: ContractAddress,
        pub to: ContractAddress,
        pub value: u256,
    }
    #[derive(Drop, starknet::Event)]
    pub struct Approval {
        pub owner: ContractAddress,
        pub spender: ContractAddress,
        pub value: u256,
    }
    #[abi(embed_v0)]
    impl ERC20Impl of super::IERC20<ContractState> {
        // create token for testing
        fn mint(ref self: ContractState, recipient: ContractAddress, amount: u256) {
            // 确保接收者地址不是零地址
            assert(recipient.is_non_zero(), Errors::MINT_TO_ZERO);

            // 增加总供应量
            let supply = self.total_supply.read() + amount;
            self.total_supply.write(supply);

            // 增加接收者的余额
            let balance = self.balances.read(recipient) + amount;
            self.balances.write(recipient, balance);

            // 发出 Transfer 事件
            self
                .emit(
                    Event::Transfer(
                        Transfer {
                            from: contract_address_const::<
                                0
                            >(), // 从零地址转账，表示铸造
                            to: recipient,
                            value: amount
                        }
                    )
                );
        }
        //get the name of the contract
        fn get_name(self: @ContractState) -> ByteArray {
            self.name.read()
        }
        //get the symbol of the contract
        fn get_symbol(self: @ContractState) -> ByteArray {
            self.symbol.read()
        }
        //get the decimals
        fn get_decimals(self: @ContractState) -> u8 {
            self.decimals.read()
        }
        //get the max/total supply
        fn get_total_supply(self: @ContractState) -> u256 {
            self.total_supply.read()
        }
        // get the balance of a contract
        fn balance_of(self: @ContractState, account: ContractAddress) -> u256 {
            self.balances.read(account)
        }
        //transfer a token to a recipient
        fn transfer(ref self: ContractState, recipient: ContractAddress, amount: u256) {
            let sender = get_caller_address();
            self.transfer_from(sender, recipient, amount)
        }
        //transfer with two argument sender and recipient
        fn transfer_from(
            ref self: ContractState,
            sender: ContractAddress,
            recipient: ContractAddress,
            amount: u256
        ) {
            //get the address of the person calling the contract
            let caller = get_caller_address();

            let sender_balance = self.balances.read(sender);
            let recipient_balance = self.balances.read(recipient);
            assert!(sender_balance >= amount, "ERROR: INSUFFICIENT BALANCE");
            if (caller != sender) {
                assert!(self.allowances.read((sender, caller)) >= amount, "ERROR: UNAUTHORISED");
            }
            self.balances.write(sender, sender_balance - amount);
            self.balances.write(recipient, recipient_balance + amount);

            self.emit(Transfer { from: caller, to: recipient, value: amount });
        }
        // approve a contract to spend your token
        fn approve(ref self: ContractState, spender: ContractAddress, amount: u256) {
            let caller = get_caller_address();
            let allowed_person = (caller, spender);
            let previous_allowance = self.allowances.read(allowed_person);
            self.allowances.write(allowed_person, previous_allowance + amount);
            self.emit(Approval { owner: caller, spender, value: amount });
        }


        //Increases the allowance
        fn increase_allowance(
            ref self: ContractState, spender: ContractAddress, added_value: u256
        ) {
            let caller = get_caller_address();
            let allowed_person = (caller, spender);
            let previous_allowance = self.allowances.read(allowed_person);
            self.allowances.write(allowed_person, previous_allowance + added_value);
            self.emit(Approval { owner: caller, spender, value: added_value });
        }
        //reduces  the allowance
        fn decrease_allowance(
            ref self: ContractState, spender: ContractAddress, subtracted_value: u256
        ) {
            let caller = get_caller_address();
            let allowed_person = (caller, spender);
            let previous_allowance = self.allowances.read(allowed_person);
            self.allowances.write(allowed_person, previous_allowance - subtracted_value);
            self.emit(Approval { owner: caller, spender, value: subtracted_value });
        }
        //gets the amount a thirs party contract is allowed to spend
        fn allowance(
            self: @ContractState, owner: ContractAddress, spender: ContractAddress
        ) -> u256 {
            self.allowances.read((owner, spender))
        }
    }
}
