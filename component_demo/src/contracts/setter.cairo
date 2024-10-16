trait ISetter<TContractState> {
    fn set(ref self: TContractState, new_number: u128);
    fn get(self: @TContractState) -> u128;
}

#[starknet::contract]
pub mod Setter {
    use starknet::ContractAddress;
    use component_demo::components::ownable::OwnableComponent as ownable;
    use component_demo::components::ownable::OwnableComponent::InternalTrait;

    component!(path: ownable, storage: ownable_storage, event: ownable_event);

    #[abi(embed_v0)]
    impl OwnableImpl = ownable::OwnableImpl<ContractState>;

    impl InternalImpl = ownable::InternalImpl<ContractState>;


    #[storage]
    struct Storage {
        #[substorage(v0)]
        ownable_storage: ownable::Storage,
        number: u128,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        ownable_event: ownable::Event,
        NumberSet: NumberSet,
    }

    #[derive(Drop, starknet::Event)]
    struct NumberSet {
        old_number: u128,
        new_number: u128,
    }

    #[constructor]
    fn constructor(ref self: ContractState, owner: ContractAddress) {
        self.ownable_storage.initializer(owner);
    }

    #[abi(embed_v0)]
    impl SetterImpl of super::ISetter<ContractState> {
        fn set(ref self: ContractState, new_number: u128) {
            self.ownable_storage.only_owner();
            let old_number = self.number.read();
            self.number.write(new_number);
            self.emit(NumberSet { old_number, new_number });
        }

        fn get(self: @ContractState) -> u128 {
            self.number.read()
        }
    }
}
