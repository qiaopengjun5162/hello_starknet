# Token Sale

## Practice

```bash
hello_starknet on  main via 🅒 base
➜
mcd token_sale

hello_starknet/token_sale on  main via 🅒 base
➜
scarb init
Created package.

token_sale on  main [?] via 🅒 base
➜
ls
Scarb.toml src

token_sale on  main [?] via 🅒 base
➜
c


hello_starknet/token_sale on  main [?] via 🅒 base took 1m 0.7s 
➜ scarb fmt && scarb build
    Updating git repository https://github.com/openzeppelin/cairo-contracts
   Compiling token_sale v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/token_sale/Scarb.toml)
    Finished `dev` profile target(s) in 48 seconds

hello_starknet/token_sale on  main [?] via 🅒 base took 49.0s 
➜ sncast --profile sepolia_account declare --contract-name TokenSale --fee-token strk
   Compiling token_sale v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/token_sale/Scarb.toml)
    Finished `dev` profile target(s) in 30 seconds
[WARNING] Profile sepolia_account does not exist in scarb, using default 'dev' profile.
command: declare
class_hash: 0x454384c1dcb562ab2c3ca5d21d0ceb2713fb9da5de9f31d6ea2c0d9a9180a5e
transaction_hash: 0x60a1d0327153ec089527eff144b3e2f841183dc21bd44c15f1787dfb5fb44e9


hello_starknet/token_sale on  main [?] via 🅒 base took 5m 0.1s 
➜ sncast --profile sepolia_account deploy --class-hash 0x454384c1dcb562ab2c3ca5d21d0ceb2713fb9da5de9f31d6ea2c0d9a9180a5e --fee-token strk
command: deploy
contract_address: 0x3da3868e9bda5bf30d4a900990b7583aee3717e96026929cb76d021b3105ad1
transaction_hash: 0x5d3f202ee41fc1645a7e9c993742261dc44bb0b2cc0756657a598e22da1d775


```

## 参考

- <https://sepolia.starkscan.co/contract/0x03da3868e9bda5bf30d4a900990b7583aee3717e96026929cb76d021b3105ad1#read-write-contract>
- <https://sepolia.voyager.online/contract/0x03da3868e9bda5bf30d4a900990b7583aee3717e96026929cb76d021b3105ad1#readContract>
