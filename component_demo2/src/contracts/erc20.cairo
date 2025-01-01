use starknet::ContractAddress;

#[starknet::interface]
trait IERC20Mint<TContractState> {
    fn mint(ref self: TContractState, recipient: ContractAddress, amount: u256);
}

#[starknet::contract]
mod ERC20 {
    use openzeppelin::token::erc20::ERC20Component;
    use starknet::contract_address_const;
    use starknet::ContractAddress;

    component!(path: ERC20Component, storage: ERC20Storage, event: ERC20Event);

    #[abi(embed_v0)]
    impl ERC20Impl = ERC20Component::ERC20Impl<ContractState>;
    #[abi(embed_v0)]
    impl ERC20MetadataImpl = ERC20Component::ERC20MetadataImpl<ContractState>;
    #[abi(embed_v0)]
    impl SafeAllowanceImpl = ERC20Component::SafeAllowanceImpl<ContractState>;
    #[abi(embed_v0)]
    impl ERC20ComelOnlyImpl = ERC20Component::ERC20ComelOnllyImpl<ContractState>;
    #[abi(embed_v0)]
    impl SafeAllowanceComelImpl =
        ERC20Component::SafeAllowanceComelImpl<ContractState>;
    impl InternalImpl = ERC20Component::InternalImpl<ContractState>;

    #[storage]
    struct Storage {
        #[substorage(v0)]
        ERC20Storage: ERC20Component::Storage,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        ERC20Event: ERC20Component::Event,
    }

    #[constructor]
    fn constructor(ref self: ContractState, name: felt252, symbol: felt252) {
        self.ERC20Storage.initializer(name, symbol);
    }

    #[abi(embed_v0)]
    impl ERC20MintImpl of super::IERC20Mint<ContractState> {
        fn mint(ref self: ContractState, recipient: ContractAddress, amount: u256) {
            self.ERC20Storage._mint(recipient, amount);
        }
    }
}
