use starknet::{ContractAddress};
use snforge_std::{declare, ContractClassTrait, DeclareResultTrait, start_cheat_caller_address};
use cairo_test_demo::counter::{
    ICounterDispatcher, ICounterDispatcherTrait, ICounterSafeDispatcher, ICounterSafeDispatcherTrait
};
pub mod Accounts {
    use super::ContractAddress;
    use core::traits::TryInto;

    pub fn owner() -> ContractAddress {
        'owner'.try_into().unwrap()
    }

    pub fn account1() -> ContractAddress {
        'account1'.try_into().unwrap()
    }
}

fn deploy(name: ByteArray) -> ContractAddress {
    let contract = declare(name).unwrap().contract_class();
    let constructor_args = array![Accounts::owner().into()];
    let (contract_address, _) = contract.deploy(@constructor_args).unwrap();
    contract_address
}

#[test]
fn test_can_increase_count() {
    // Deploy contract
    let contract_address = deploy("Counter");

    let counter_dispatcher = ICounterDispatcher { contract_address };

    let initial_count = counter_dispatcher.get_count();
    assert_eq!(initial_count, 0);

    start_cheat_caller_address(contract_address, Accounts::owner());

    counter_dispatcher.increase_count(10);

    let current_count = counter_dispatcher.get_count();
    assert_eq!(current_count, 10);
}

#[test]
#[feature("safe_dispatcher")]
fn test_increase_count_should_panic_when_called_with_zero() {
    let contract_address = deploy("Counter");

    let counter_safe_dispatcher = ICounterSafeDispatcher { contract_address };

    start_cheat_caller_address(contract_address, Accounts::owner());

    match counter_safe_dispatcher.increase_count(0) {
        Result::Ok(_) => panic!("Should have panicked"),
        Result::Err(panic_data) => {
            assert(*panic_data.at(0) == 'zero amount', *panic_data.at(0));
        }
    }
}
