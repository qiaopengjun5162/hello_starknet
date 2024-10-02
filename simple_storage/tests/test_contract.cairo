use starknet::{ContractAddress, contract_address_const};

use snforge_std::{
    declare, ContractClassTrait, DeclareResultTrait, start_cheat_caller_address,
    stop_cheat_caller_address
};

use simple_storage::simple_storage::ISimpleStorageDispatcher;
use simple_storage::simple_storage::ISimpleStorageDispatcherTrait;

fn deploy_contract(name: ByteArray, initial_data: u128, owner: ContractAddress) -> ContractAddress {
    let contract = declare(name).unwrap().contract_class();
    let constructor_args = array![initial_data.into(), owner.into()];
    let (contract_address, _) = contract.deploy(@constructor_args).unwrap();
    contract_address
}

#[test]
fn test_initial_value() {
    let initial_data = 42_u128;
    let owner = contract_address_const::<0x1>();
    let contract_address = deploy_contract("SimpleStorage", initial_data, owner);
    let dispatcher = ISimpleStorageDispatcher { contract_address };
    let stored_data = dispatcher.get_data();
    assert(stored_data == initial_data, 'Initial data should match');
}

#[test]
fn test_set_and_get_data() {
    let initial_data = 0_u128;
    let owner = contract_address_const::<0x1>();
    let contract_address = deploy_contract("SimpleStorage", initial_data, owner);
    let dispatcher = ISimpleStorageDispatcher { contract_address };

    // Use start_cheat_caller_address to set the caller address
    start_cheat_caller_address(contract_address, owner);
    dispatcher.set_data(42);
    let updated_data = dispatcher.get_data();
    assert(updated_data == 42, 'Updated data should be 42');
    stop_cheat_caller_address(contract_address);
}

#[test]
fn test_multiple_updates() {
    let initial_data = 5_u128;
    let owner = contract_address_const::<0x1>();
    let contract_address = deploy_contract("SimpleStorage", initial_data, owner);
    let dispatcher = ISimpleStorageDispatcher { contract_address };

    assert(dispatcher.get_data() == 5, 'Initial data should be 5');

    // Use start_cheat_caller_address for all set_data calls
    start_cheat_caller_address(contract_address, owner);

    dispatcher.set_data(10);
    assert(dispatcher.get_data() == 10, 'Data should be 10');

    dispatcher.set_data(20);
    assert(dispatcher.get_data() == 20, 'Data should be 20');

    dispatcher.set_data(30);
    assert(dispatcher.get_data() == 30, 'Data should be 30');

    stop_cheat_caller_address(contract_address);
}

#[test]
fn test_zero_value() {
    let initial_data = 100_u128;
    let owner = contract_address_const::<0x1>();
    let contract_address = deploy_contract("SimpleStorage", initial_data, owner);
    let dispatcher = ISimpleStorageDispatcher { contract_address };

    assert(dispatcher.get_data() == 100, 'Initial data should be 100');

    // Use start_cheat_caller_address to set the data
    start_cheat_caller_address(contract_address, owner);
    dispatcher.set_data(0);
    assert(dispatcher.get_data() == 0, 'Data should be reset to 0');
    stop_cheat_caller_address(contract_address);
}

#[test]
fn test_owner() {
    let initial_data = 0_u128;
    let owner = contract_address_const::<0x1>();
    let contract_address = deploy_contract("SimpleStorage", initial_data, owner);
    let dispatcher = ISimpleStorageDispatcher { contract_address };

    assert(dispatcher.get_owner() == owner, 'Owner should match');
}
