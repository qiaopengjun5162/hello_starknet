use starknet::ContractAddress;
use starknet::contract_address_const;
use snforge_std::{declare, ContractClassTrait, DeclareResultTrait, stark_prank, stop_prank};


use component_demo::contracts::setter::ISetterDispatcher;
use component_demo::contracts::setter::ISetterDispatcherTrait;

use component_demo::components::ownable::IOwnableDispatcher;
use component_demo::components::ownable::IOwnableDispatcherTrait;

fn deploy_contract(name: felt252, owner: ContractAddress) -> ContractAddress {
    let contract = declare(name).unwrap().contract_class();
    let (contract_address, _) = contract.deploy(@array![owner.into()]).unwrap();
    contract_address
}

#[test]
fn test_component() {
    let owner = contract_address_const::<'owner'>();
    let contract_address = deploy_contract('Setter', owner);
    let contract_setter = ISetterDispatcher { contract_address };
    let contract_ownable = IOwnableDispatcher { contract_address };

    assert(contract_setter.get() == 0, "Wrong 1");
    assert(contract_ownable.owner() == owner, "Wrong 2");
}
