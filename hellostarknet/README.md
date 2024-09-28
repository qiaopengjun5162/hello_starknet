# Hello Starknet

```shell
hellostarknet on  main [?] via 🅒 base took 9.6s 
➜ sncast --account qiao declare --url $SEPOLIA_RPC_URL --contract-name HelloStarknet --fee-token eth   
   Compiling snforge_scarb_plugin v0.1.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.30.0#196f06b251926697c3d66800f2a93ae595e76496)
    Finished `release` profile [optimized] target(s) in 0.18s
   Compiling hellostarknet v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/hellostarknet/Scarb.toml)
    Finished release target(s) in 4 seconds
command: declare
class_hash: 0x5c10f4b31832b415e47db4ee285c5b94bad4f571e6e1044d4fdf833a2e3a461
transaction_hash: 0x545fd29936fe98412db1b7fe13c51121656292b163170d4edd33bdc7e818082

To see declaration details, visit:
class: https://starkscan.co/search/5c10f4b31832b415e47db4ee285c5b94bad4f571e6e1044d4fdf833a2e3a461
transaction: https://starkscan.co/search/545fd29936fe98412db1b7fe13c51121656292b163170d4edd33bdc7e818082


hellostarknet on  main [?] via 🅒 base took 8.1s 
➜ sncast --account qiao deploy --url $SEPOLIA_RPC_URL --fee-token eth --class-hash 0x5c10f4b31832b415e47db4ee285c5b94bad4f571e6e1044d4fdf833a2e3a461
command: deploy
contract_address: 0x71854d266930b7eba3800a4548ae3aee61dc54e48724c0b9aee0e4805eebbf3
transaction_hash: 0x4fa3bb58f16d74563770607a14f43d609559e83b624a1c85212909ed0661cc8

To see deployment details, visit:
contract: https://starkscan.co/search/71854d266930b7eba3800a4548ae3aee61dc54e48724c0b9aee0e4805eebbf3
transaction: https://starkscan.co/search/4fa3bb58f16d74563770607a14f43d609559e83b624a1c85212909ed0661cc8


```

- <https://sepolia.starkscan.co/contract/0x071854d266930b7eba3800a4548ae3aee61dc54e48724c0b9aee0e4805eebbf3#overview>
