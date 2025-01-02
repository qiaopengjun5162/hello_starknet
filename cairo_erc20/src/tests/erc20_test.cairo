use core::traits::Into;
use core::option::OptionTrait;
use cairo_erc20::erc20::ERC20;
use cairo_erc20::erc20::IERC20Dispatcher;
use cairo_erc20::erc20::IERC20DispatcherTrait;
use cairo_erc20::erc20::ERC20::{Event, Approval, Transfer};

use starknet::contract_address::ContractAddress;
use starknet::syscalls::deploy_syscall;
use starknet::contract_address_const;
use starknet::testing::set_contract_address;

use core::integer::BoundedInt;
use core::test::test_utils::assert_eq;

const NAME: felt252 = 'TEST';
const SYMBOL: felt252 = 'TET';
const DECIMALS: u8 = 18_u8;

#[test]
fn test_initializer() {
    let mut calldata = array![NAME, SYMBOL, DECIMALS.into()];

    let (erc20_address, _) = deploy_syscall(
        ERC20::TEST_CLASS_HASH.try_into().unwrap(), 0, calldata.span(), false
    )
        .unwrap();

    let erc20_token = IERC20Dispatcher { contract_address: erc20_address };

    assert_eq(@erc20_token.name(), @NAME, 'Name should be NAME');
    assert_eq(@erc20_token.symbol(), @SYMBOL, 'Symbol should be SYMBOL');
    assert_eq(@erc20_token.decimals(), @DECIMALS, 'Decimals should be DECIMALS');
}

fn setUp() -> (ContractAddress, IERC20Dispatcher, ContractAddress) {
    let caller = contract_address_const::<1>();
    //将合约地址设置为提供的值。
    set_contract_address(caller);

    let mut calldata = array![NAME, SYMBOL, DECIMALS.into()];

    let (erc20_address, _) = deploy_syscall(
        ERC20::TEST_CLASS_HASH.try_into().unwrap(), 0, calldata.span(), false
    )
        .unwrap();
    let mut erc20_token = IERC20Dispatcher { contract_address: erc20_address };
    (caller, erc20_token, erc20_address)
}

#[test]
fn test_approve() {
    let (caller, erc20_token, erc20_address) = setUp();

    let spender = contract_address_const::<2>();
    let amount = 2000_u256;

    erc20_token.approve(spender, amount);
    assert_eq(@erc20_token.allowance(caller, spender), @amount, 'Approve should be equal to 2000');
    assert_eq(
        @starknet::testing::pop_log(erc20_address).unwrap(),
        @Event::Approval(Approval { owner: caller, spender, value: amount }),
        'Approve Not Emit'
    );
}

#[test]
fn test_mint() {
    let (caller, erc20_token, erc20_address) = setUp();
    let amount = 2000_u256;
    erc20_token.mint(amount);
    assert_eq(@erc20_token.balanceOf(caller), @amount, 'Mint should be equal to 2000');
    assert_eq(
        @starknet::testing::pop_log(erc20_address).unwrap(),
        @Event::Transfer(Transfer { from: core::Zeroable::zero(), to: caller, value: amount }),
        'Transfer Emit'
    )
}

#[test]
fn test_transfer() {
    let (from, erc20_token, _) = setUp();
    let amount = 2000_u256;
    erc20_token.mint(amount);
    let to = contract_address_const::<2>();
    erc20_token.transfer(to, amount);
    assert_eq(
        @erc20_token.balanceOf(from), @core::Zeroable::zero(), 'Transfer should be equal to 0'
    );
    assert_eq(@erc20_token.balanceOf(to), @amount, 'Transfer equal to 2000');
}

#[test]
#[should_panic(expected: ('u256_sub Overflow', 'ENTRYPOINT_FAILED'))]
fn test_err_transfer() {
    let (from, erc20_token, _) = setUp();
    let amount = 2000_u256;
    erc20_token.mint(amount);
    let to = contract_address_const::<2>();
    erc20_token.transfer(to, amount + 1);
    assert_eq(
        @erc20_token.balanceOf(from), @core::Zeroable::zero(), 'Transfer should be equal to 0'
    );
}

#[test]
fn test_transfer_from() {
    let amount = 2000_u256;
    let (owner, erc20_token, erc20_address) = setUp();

    let from = contract_address_const::<2>();
    let to = contract_address_const::<3>();

    erc20_token.mint(amount);
    erc20_token.approve(from, amount);

    set_contract_address(from);
    erc20_token.transferFrom(owner, to, 1000);

    assert(erc20_token.balanceOf(owner) == 1000, 'Balance owner should be == 1000');
    assert(erc20_token.balanceOf(to) == 1000, 'Balance to should be == 1000');
    assert(erc20_token.allowance(owner, from) == 1000, 'Approve should be == 1000');

    assert_eq(
        @starknet::testing::pop_log(erc20_address).unwrap(),
        @Event::Transfer(Transfer { from: core::Zeroable::zero(), to: owner, value: amount }),
        'Mint Emit'
    );

    assert_eq(
        @starknet::testing::pop_log(erc20_address).unwrap(),
        @Event::Approval(Approval { owner: owner, spender: from, value: amount }),
        'First Approve Emit'
    );

    assert_eq(
        @starknet::testing::pop_log(erc20_address).unwrap(),
        @Event::Approval(Approval { owner: owner, spender: from, value: 1000 }),
        'Transfer Approve Emit'
    );

    assert_eq(
        @starknet::testing::pop_log(erc20_address).unwrap(),
        @Event::Transfer(Transfer { from: owner, to: to, value: 1000 }),
        'TransferFrom Emit'
    );
}

#[test]
fn test_MAXApproveTransfer() {
    let max: u256 = BoundedInt::max();

    let amount = 2000;

    let (owner, erc20_token, _) = setUp();

    let from = contract_address_const::<2>();
    let to = contract_address_const::<3>();

    erc20_token.mint(amount);
    erc20_token.approve(from, max);

    set_contract_address(from);
    erc20_token.transferFrom(owner, to, 1000);

    assert(erc20_token.allowance(owner, from) == max, 'Max Approve invarient');

    assert_eq!(erc20_token.balanceOf(owner), 1000);
    assert_eq!(erc20_token.balanceOf(to), 1000);
    assert_eq!(erc20_token.balanceOf(from), 0);
}
