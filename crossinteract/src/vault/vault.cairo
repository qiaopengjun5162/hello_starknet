// deposit
// withdrww

use core::starknet::ContractAddress;

#[starknet::interface]
pub trait IVault<TContractState> {
    fn deposit(ref self: TContractState, token_address: ContractAddress, amount: u256);
    fn withdrww(ref self: TContractState, token_address: ContractAddress, amount: u256);
    fn balance(self: @TContractState, token_address: ContractAddress) -> u256;
}

#[starknet::contract]
pub mod Vault {
    use super::IVault;
    use crossinteract::erc20::erc20::{IERC20Dispatcher, IERC20DispatcherTrait};
    use core::starknet::{
        get_caller_address, ContractAddress,
        storage::{Map, StorageMapReadAccess, StorageMapWriteAccess}
    };

    #[storage]
    struct Storage {
        balance: Map<
            (ContractAddress, ContractAddress), u256
        >, // MAP<(USER ADDRESS, TOKEN ADDRESS), AMOUNT>
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {}

    #[constructor]
    fn constructor(ref self: ContractState) {}

    #[abi(embed_v0)]
    impl VaultImpl of IVault<ContractState> {
        fn deposit(ref self: ContractState, token_address: ContractAddress, amount: u256) {
            let caller = get_caller_address();
            let token_dispatcher = IERC20Dispatcher { contract_address: token_address };
            //  cross contract interaction
            // process transfer
            let success = token_dispatcher.transfer(amount, caller);
            assert(success == true, 'Transfer failed');
            let current_balance = self.balance.read((caller, token_address));
            self.balance.write((caller, token_address), current_balance + amount);
        }

        fn withdrww(ref self: ContractState, token_address: ContractAddress, amount: u256) {
            let caller = get_caller_address();
            let current_balance = self.balance.read((caller, token_address));

            assert(current_balance >= amount, 'Insufficient balance');

            // connect to ERC20 token contract
            let erc20_dispatcher = IERC20Dispatcher { contract_address: token_address };
            // process transfer
            let success = erc20_dispatcher.transfer(amount, caller);
            assert(success == true, 'Transfer failed');
            // deduct the withdrawn amount from the current balance
            self.balance.write((caller, token_address), current_balance - amount);
        }
        fn balance(self: @ContractState, token_address: ContractAddress) -> u256 {
            let caller = get_caller_address();
            self.balance.read((caller, token_address))
        }
    }
}
