# intro_to_components

## 实操

```bash
hello_starknet/intro_to_components on  main [?] via 🅒 base 
➜ source .env                                                                                        


hello_starknet/intro_to_components on  main [?] via 🅒 base 
➜ sncast --account qiao declare --url $SEPOLIA_RPC_URL --contract-name OwnableCounter --fee-token eth
   Compiling snforge_scarb_plugin v0.31.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.31.0#72ea785ca354e9e506de3e5d687da9fb2c1b3c67)
    Finished `release` profile [optimized] target(s) in 0.26s
   Compiling intro_to_components v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/intro_to_components/Scarb.toml)
warn: Unused import: `intro_to_components::ownable_counter::OwnableCounter::get_caller_address`
 --> /Users/qiaopengjun/Code/starknet-code/hello_starknet/intro_to_components/src/ownable_counter.cairo:12:43
    use core::starknet::{ContractAddress, get_caller_address};
                                          ^****************^

    Finished release target(s) in 5 seconds
command: declare
class_hash: 0x711a66dd78587068f72231c8b950cee0fb0992c72dbe4e4d9baf142e2f15978
transaction_hash: 0x57277942a4883ce89603708ec6718302f81ff1d71983e161ff60d6b46f0060b

To see declaration details, visit:
class: https://sepolia.starkscan.co/class/0x711a66dd78587068f72231c8b950cee0fb0992c72dbe4e4d9baf142e2f15978
transaction: https://sepolia.starkscan.co/tx/0x57277942a4883ce89603708ec6718302f81ff1d71983e161ff60d6b46f0060b


hello_starknet/intro_to_components on  main [?] via 🅒 base took 13.8s 
➜ touch README.md

hello_starknet/intro_to_components on  main [?] via 🅒 base 
➜ sncast --account qiao deploy --url $SEPOLIA_RPC_URL --fee-token eth --class-hash 0x711a66dd78587068f72231c8b950cee0fb0992c72dbe4e4d9baf142e2f15978 --constructor-calldata 0x05Dc37385b577eAa42FF48379a359e8211C5142dA545A97e324b9c87286f0873
command: deploy
contract_address: 0x360d2d92e34e120f3f88ac87e5cdb5cb5e99b2191416a209cc052921bd40ebd
transaction_hash: 0x75eb691d86a9b9e31fea51c096f1f9d0fed36d9059048d4453680bd6c542445

To see deployment details, visit:
contract: https://sepolia.starkscan.co/contract/0x360d2d92e34e120f3f88ac87e5cdb5cb5e99b2191416a209cc052921bd40ebd
transaction: https://sepolia.starkscan.co/tx/0x75eb691d86a9b9e31fea51c096f1f9d0fed36d9059048d4453680bd6c542445

```

## 参考

- <https://sepolia.starkscan.co/contract/0x360d2d92e34e120f3f88ac87e5cdb5cb5e99b2191416a209cc052921bd40ebd#read-write-contract-sub-read>
- <https://www.youtube.com/watch?v=Md9W53oQ1E4>
- <https://github.com/EjembiEmmanuel/into_to_components/blob/main/tests/test_ownable_comp.cairo>
