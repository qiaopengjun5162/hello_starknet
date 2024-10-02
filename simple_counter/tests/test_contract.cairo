use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

use simple_counter::simple_counter::ISimpleCounterDispatcher;
use simple_counter::simple_counter::ISimpleCounterDispatcherTrait;

fn deploy_contract(name: ByteArray, initial_count: u128) -> ContractAddress {
    let contract = declare(name).unwrap().contract_class();
    let constructor_args = array![initial_count.into()];
    let (contract_address, _) = contract.deploy(@constructor_args).unwrap();
    contract_address
}

#[test]
fn test_initial_count() {
    let initial_count: u128 = 0;
    let contract_address = deploy_contract("SimpleCounter", initial_count);
    let dispatcher = ISimpleCounterDispatcher { contract_address };

    assert(dispatcher.get_current_count() == initial_count, 'Initial count should match');
}

#[test]
fn test_increment() {
    let initial_count: u128 = 5;
    let contract_address = deploy_contract("SimpleCounter", initial_count);
    let dispatcher = ISimpleCounterDispatcher { contract_address };

    dispatcher.increment();
    assert(dispatcher.get_current_count() == initial_count + 1, 'Count should increase by 1');

    dispatcher.increment();
    assert(dispatcher.get_current_count() == initial_count + 2, 'Count should increase by 2');
}

#[test]
fn test_decrement() {
    let initial_count: u128 = 10;
    let contract_address = deploy_contract("SimpleCounter", initial_count);
    let dispatcher = ISimpleCounterDispatcher { contract_address };

    dispatcher.decrement();
    assert(dispatcher.get_current_count() == initial_count - 1, 'Count should decrease by 1');

    dispatcher.decrement();
    assert(dispatcher.get_current_count() == initial_count - 2, 'Count should decrease by 2');
}


#[test]
#[should_panic(expected: ('u128_sub Overflow',))]
fn test_decrement_underflow() {
    let initial_count: u128 = 0;
    let contract_address = deploy_contract("SimpleCounter", initial_count);
    let dispatcher = ISimpleCounterDispatcher { contract_address };

    dispatcher.decrement();
}


#[test]
#[should_panic(expected: ('u128_add Overflow',))]
fn test_increment_overflow() {
    let initial_count: u128 = 340282366920938463463374607431768211455; // Max u128 value
    let contract_address = deploy_contract("SimpleCounter", initial_count);
    let dispatcher = ISimpleCounterDispatcher { contract_address };

    dispatcher.increment();
}
