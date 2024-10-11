use starknet::ContractAddress;

#[starknet::interface]
pub trait IOwnable<TContractState> {
    fn owner(self: @TContractState) -> ContractAddress;
    fn transfer_ownership(ref self: TContractState, new_owner: ContractAddress);
    fn renounce_ownership(ref self: TContractState);
}

#[starknet::component]
pub mod OwnableComponent {
    use core::num::traits::Zero;
    use core::zeroable::Zeroable;

    use starknet::ContractAddress;
    use starknet::get_caller_address; // msg.sender

    #[storage]
    struct Storage {
        owner: ContractAddress
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        OwnershipTransferred: OwnershipTransferred,
    }

    #[derive(Drop, starknet::Event)]
    struct OwnershipTransferred {
        previous_owner: ContractAddress,
        new_owner: ContractAddress,
    }

    #[embeddable_as(OwnableImpl)]
    impl Ownable<
        TContractState, +HasComponent<TContractState>
    > of super::IOwnable<ComponentState<TContractState>> {
        fn owner(self: @ComponentState<TContractState>) -> ContractAddress {
            self.owner.read()
        }

        fn transfer_ownership(
            ref self: ComponentState<TContractState>, new_owner: ContractAddress
        ) {
            assert(!new_owner.is_zero(), "Invalid owner");
            self.only_owner();
            self._transfer_ownership(new_owner);
        }

        fn renounce_ownership(ref self: ComponentState<TContractState>) {
            self.only_owner();
            self._transfer_ownership(Zeroable::zero());
        }
    }

    #[generate_trait]
    impl InternalImpl<
        TContractState, +HasComponent<TContractState>
    > of InternalTrait<TContractState> {
        fn initializer(ref self: ComponentState<TContractState>, owner: ContractAddress) {
            self._transfer_ownership(owner);
        }

        fn only_owner(self: @ComponentState<TContractState>) {
            let owner: ContractAddress = self.owner.read();
            let caller: ContractAddress = get_caller_address();
            assert(!caller.is_zero(), 'caller is 0');
            assert(caller == owner, 'Only the owner can call this function.');
        }


        fn _transfer_ownership(
            ref self: ComponentState<TContractState>, new_owner: ContractAddress
        ) {
            let previous_owner = self.owner.read();
            self.owner.write(new_owner);
            self.emit(OwnershipTransferred { previous_owner, new_owner });
        }
    }
}
