use starknet::ContractAddress;
use starknet::contract_address_const;
use debug::PrintTrait;

use snforge_std::{declare, ContractClassTrait, start_prank, stop_prank, CheatTarget};

use component_demo::contracts::setter::ISetterDispatcher;
use component_demo::contracts::setter::ISetterDispatcherTrait;

use component_demo::components::ownable::IOwnableDispatcher;
use component_demo::components::ownable::IOwnableDispatcherTrait;

fn deploy_contract(name: felt252, owner: ContractAddress) -> ContractAddress {
    let contract = declare(name);
    contract.deploy(@array![owner.into()]).unwrap()
}

#[test]
fn test_abc() {
    let owner = contract_address_const::<'owner'>();
    let contract_address = deploy_contract('Setter', owner);
    let contract_setter = ISetterDispatcher { contract_address };
    let contract_ownable = IOwnableDispatcher { contract_address };

    assert(contract_setter.get() == 0, 'contract_setter should be 0');
    assert(contract_ownable.owner() == owner, 'contractownable should be owner');

    start_prank(
        CheatTarget::One(contract_address), owner
    ); // 设置prank为owner，这样setter的调用者就是owner
    contract_setter.set(12);
    stop_prank(CheatTarget::One(contract_address));
    assert(contract_setter.get() == 12, 'contract_setter should be 12');

    let new_owner = contract_address_const::<'new_owner'>();
    start_prank(CheatTarget::One(contract_address), owner);
    contract_ownable.transfer_ownership(new_owner);
    stop_prank(CheatTarget::One(contract_address));
    assert(contract_ownable.owner() == new_owner, 'contractownable new_owner');

    // renounce_ownership
    start_prank(CheatTarget::One(contract_address), new_owner);
    contract_ownable.renounce_ownership();
    stop_prank(CheatTarget::One(contract_address));

    contract_ownable.owner().print();
}
