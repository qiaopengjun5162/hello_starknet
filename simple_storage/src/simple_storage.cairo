// Interface definition for SimpleStorage contract
#[starknet::interface]
pub trait ISimpleStorage<TContractState> {
    // Function to get the stored data
    fn get_data(self: @TContractState) -> u128;
    // Function to set new data
    fn set_data(ref self: TContractState, new_value: u128);
    // Function to get the owner address
    fn get_owner(self: @TContractState) -> starknet::ContractAddress;
}

// SimpleStorage contract implementation
#[starknet::contract]
mod SimpleStorage {
    use starknet::{ContractAddress, get_caller_address};

    // Storage structure definition
    #[storage]
    struct Storage {
        data: u128,
        owner: ContractAddress,
    }

    // Constructor function
    #[constructor]
    fn constructor(ref self: ContractState, initial_data: u128, owner: ContractAddress) {
        // Initialize data with the provided initial_data
        self.data.write(initial_data);
        // Set the owner to the provided owner address
        self.owner.write(owner);
    }

    // Implementation of the ISimpleStorage interface
    #[abi(embed_v0)]
    impl SimpleStorageImpl of super::ISimpleStorage<ContractState> {
        // Function to retrieve the stored data
        fn get_data(self: @ContractState) -> u128 {
            self.data.read()
        }

        // Function to update the stored data
        fn set_data(ref self: ContractState, new_value: u128) {
            // Check if the caller is the owner
            let caller = get_caller_address();
            assert(caller == self.owner.read(), 'Only the owner can set data');
            self.data.write(new_value);
        }

        // Function to get the owner address
        fn get_owner(self: @ContractState) -> ContractAddress {
            self.owner.read()
        }
    }
}
