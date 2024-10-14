# Starknet ERC20

## 实操

```bash
hello_starknet/starknet_erc20 on  main [?] via 🅒 base 
➜ sncast --version
sncast 0.31.0

hello_starknet/starknet_erc20 on  main [?] via 🅒 base 
➜ starknet-devnet   

hello_starknet/starknet_erc20 on  main [?] via 🅒 base 
➜ sncast account add --address 0x3db6c9af232edf8c30967fd4b64fc548becd4f116f6f385c5a1a0b1809c3114 --private-key 0x524318337149f906e46d2da259025d85 --url http://127.0.0.1:5050 --type oz --name erc20-account --add-pro
file dev-profile
command: account add
add_profile: Profile dev-profile successfully added to snfoundry.toml



hello_starknet/starknet_erc20 on  main [!?] via 🅒 base 
➜ sncast --profile dev-profile declare --contract-name ERC20 --fee-token strk          
   Compiling snforge_scarb_plugin v0.31.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.31.0#72ea785ca354e9e506de3e5d687da9fb2c1b3c67)
    Finished `release` profile [optimized] target(s) in 0.17s
   Compiling starknet_erc20 v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/starknet_erc20/Scarb.toml)
    Finished release target(s) in 4 seconds
[WARNING] Profile dev-profile does not exist in scarb, using 'release' profile.
command: declare
error: An error occurred in the called contract = ContractErrorData { revert_error: "Sierra compilation error: Unable to compile Sierra to Casm. No matching ContractClass or CasmContractClass found for version 1.6.0" }

hello_starknet/starknet_erc20 on  main [!?] via 🅒 base took 5.9s 
➜ source .env                                                                


hello_starknet/starknet_erc20 on  main [!?] via 🅒 base 
➜ sncast --account qiao declare --url $SEPOLIA_RPC_URL --contract-name ERC20 --fee-token eth         
   Compiling snforge_scarb_plugin v0.31.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.31.0#72ea785ca354e9e506de3e5d687da9fb2c1b3c67)
    Finished `release` profile [optimized] target(s) in 0.19s
   Compiling starknet_erc20 v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/starknet_erc20/Scarb.toml)
    Finished release target(s) in 5 seconds
command: declare
class_hash: 0x26951313b610f4dffd2f3aa6798cb84de8428ad4a8023854f251ca40264932a
transaction_hash: 0x176899fc7b9275f5d520d928ea8b357ad0d224c146b4b01f782f153683f7cf6

To see declaration details, visit:
class: https://sepolia.starkscan.co/class/0x26951313b610f4dffd2f3aa6798cb84de8428ad4a8023854f251ca40264932a
transaction: https://sepolia.starkscan.co/tx/0x176899fc7b9275f5d520d928ea8b357ad0d224c146b4b01f782f153683f7cf6

hello_starknet/starknet_erc20 on  main [!?] via 🅒 base took 15.4s 
➜ sncast --account qiao deploy --url $SEPOLIA_RPC_URL --fee-token eth --class-hash 0x26951313b610f4dffd2f3aa6798cb84de8428ad4a8023854f251ca40264932a --constructor-calldata MyERC20Token MET                         
error: invalid value 'MyERC20Token' for '--constructor-calldata <CONSTRUCTOR_CALLDATA>...': Failed to create Felt from string

For more information, try '--help'.

hello_starknet/starknet_erc20 on  main [!?] via 🅒 base 
➜ sncast --account qiao deploy --url $SEPOLIA_RPC_URL --fee-token eth --class-hash 0x26951313b610f4dffd2f3aa6798cb84de8428ad4a8023854f251ca40264932a --constructor-calldata 'MyERC20Token' 'MET'
error: invalid value 'MyERC20Token' for '--constructor-calldata <CONSTRUCTOR_CALLDATA>...': Failed to create Felt from string

For more information, try '--help'.
```
