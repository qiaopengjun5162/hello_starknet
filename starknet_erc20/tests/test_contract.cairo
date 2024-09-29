use starknet::ContractAddress;
use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};
use starknet_erc20::erc20::IERC20Dispatcher;
use starknet_erc20::erc20::IERC20DispatcherTrait;

// fn deploy_contract(name: ByteArray) -> ContractAddress {
//     let contract = declare(name).unwrap().contract_class();
//     let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
//     contract_address
// }

#[derive(Drop, Serde)]
struct ERC20Args {
    name: ByteArray,
    symbol: ByteArray
}

fn deploy_contract(name: ByteArray) -> ContractAddress {
    let class_hash = declare(name).unwrap().contract_class();
    let mut constructor_args = array![];
    let args = ERC20Args { name: "ERC20 TOKEN", symbol: "ET" };
    args.serialize(ref constructor_args);
    let (address, _) = class_hash.deploy(@constructor_args).unwrap();
    address
}

#[test]
fn test_deploy_erc20() {
    let contract_address = deploy_contract("ERC20");
    let erc20 = IERC20Dispatcher { contract_address };
    let name = erc20.get_name();
    assert!(name == "ERC20 TOKEN", "INVALID NAME");

    assert_eq!(erc20.get_name(), "ERC20 TOKEN");
    assert_eq!(erc20.get_symbol(), "ET", "Invalid symbol");
    assert_eq!(erc20.get_total_supply(), 100_000_000_u256, "Invalid total supply");
}

#[test]
fn test_initial_balance() {
    let contract_address = deploy_contract("ERC20");
    let erc20 = IERC20Dispatcher { contract_address };
    let recipient = starknet::contract_address_const::<0x1>();

    assert_eq!(erc20.balance_of(recipient), 0, "Invalid initial balance");
}

#[test]
fn test_mint() {
    let contract_address = deploy_contract("ERC20");
    let erc20 = IERC20Dispatcher { contract_address };
    let recipient = starknet::contract_address_const::<0x1>();
    let amount = 1000_u256;

    // 检查初始余额
    let initial_balance = erc20.balance_of(recipient);
    assert_eq!(initial_balance, 0_u256, "Initial balance should be zero");

    // 第一次铸币
    erc20.mint(recipient, amount);
    let balance_after_first_mint = erc20.balance_of(recipient);
    assert_eq!(balance_after_first_mint, amount, "Invalid balance after first minting");

    // 第二次铸币
    erc20.mint(recipient, amount);
    let new_balance = erc20.balance_of(recipient);
    assert_eq!(new_balance, 2 * amount, "Invalid balance after second minting");
}

