# Starknet Js

## 实操

```bash
hello_starknet on  main via 🅒 base
➜
mcd simple_storage_starknetjs

hello_starknet/simple_storage_starknetjs on  main via 🅒 base
➜
c

hello_starknet/simple_storage_starknetjs on  main via 🅒 base 
➜ ls

hello_starknet/simple_storage_starknetjs on  main via 🅒 base 
➜ touch index.js                    

hello_starknet/simple_storage_starknetjs on  main [?] via ⬢ v22.1.0 via 🅒 base 
➜ touch README.md

hello_starknet/simple_storage_starknetjs on  main [?] is 📦 1.0.0 via ⬢ v22.1.0 via 🅒 base took 3.9s 
➜ node index.js
(node:3820) [DEP0040] DeprecationWarning: The `punycode` module is deprecated. Please use a userland alternative instead.
(Use `node --trace-deprecation ...` to show where the warning was created)
Block number: 235510

hello_starknet/simple_storage_starknetjs on  main [?] is 📦 1.0.0 via ⬢ v22.1.0 via 🅒 base took 5.6s 
➜ touch .gitignore  

hello_starknet/simple_storage_starknetjs on  main [?] is 📦 1.0.0 via ⬢ v22.1.0 via 🅒 base 
➜ touch .env        

hello_starknet/simple_storage_starknetjs on  main [?] is 📦 1.0.0 via ⬢ v22.1.0 via 🅒 base 
➜ pnpm install dotenv --save


hello_starknet/simple_storage_starknetjs on  main [!?] is 📦 1.0.0 via ⬢ v22.1.0 via 🅒 base took 29.0s 
➜ node index.js
(node:93426) ExperimentalWarning: Importing JSON modules is an experimental feature and might change at any time
(Use `node --trace-warnings ...` to show where the warning was created)
(node:93426) [DEP0040] DeprecationWarning: The `punycode` module is deprecated. Please use a userland alternative instead.
Block number: 236552
Storage data:  20
Transaction response:  {
  transaction_hash: '0x7878630de312f3ca64e1b18042bd0b1ee609a3eb4ad7c636287b594a7dcd39e'
}
Transaction receipt:  _ReceiptTx {
  actual_fee: { amount: '0x4673051078', unit: 'WEI' },
  block_hash: '0x31c1437fe978101a9c6a80ec4dd5e143dec67cdcb8b3606db19d711d08b715c',
  block_number: 236553,
  events: [
    {
      data: [Array],
      from_address: '0x49d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7',
      keys: [Array]
    }
  ],
  execution_resources: {
    data_availability: { l1_data_gas: 256, l1_gas: 0 },
    ec_op_builtin_applications: 3,
    pedersen_builtin_applications: 19,
    poseidon_builtin_applications: 5,
    range_check_builtin_applications: 307,
    steps: 11447
  },
  execution_status: 'SUCCEEDED',
  finality_status: 'ACCEPTED_ON_L2',
  messages_sent: [],
  transaction_hash: '0x7878630de312f3ca64e1b18042bd0b1ee609a3eb4ad7c636287b594a7dcd39e',
  type: 'INVOKE'
}
Storage data:  25


```

## 参考

- <http://starknetjs.com/>
- <https://sepolia.voyager.online/contract/0x01279b2950ecde226ef6e7dc625b65d38cd5eae4eec4b60a0ffad1feecf19b84#accountCalls>
