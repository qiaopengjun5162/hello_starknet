# Simple Storage

## 实操

```bash
brew install lcov


simple_storage on  main [?] via 🅒 base took 14.0s
➜ scarb test --coverage
     Running test simple_storage (snforge test)
   Compiling snforge_scarb_plugin v0.31.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.31.0#72ea785ca354e9e506de3e5d687da9fb2c1b3c67)
    Finished `release` profile [optimized] target(s) in 0.19s
   Compiling simple_storage v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/simple_storage/Scarb.toml)
    Finished release target(s) in 4 seconds
   Compiling snforge_scarb_plugin v0.31.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.31.0#72ea785ca354e9e506de3e5d687da9fb2c1b3c67)
    Finished `release` profile [optimized] target(s) in 0.13s
   Compiling test(simple_storage_unittest) simple_storage v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/simple_storage/Scarb.toml)
   Compiling test(simple_storage_integrationtest) simple_storage_integrationtest v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/simple_storage/Scarb.toml)
    Finished release target(s) in 9 seconds


Collected 4 test(s) from simple_storage package
Running 0 test(s) from src/
[WARNING] No trace data to generate coverage from
Running 4 test(s) from tests/
[PASS] simple_storage_integrationtest::test_contract::test_initial_value (gas: ~105)
[PASS] simple_storage_integrationtest::test_contract::test_set_and_get_data (gas: ~171)
[PASS] simple_storage_integrationtest::test_contract::test_zero_value (gas: ~113)
[PASS] simple_storage_integrationtest::test_contract::test_multiple_updates (gas: ~183)
Tests: 4 passed, 0 failed, 0 skipped, 0 ignored, 0 filtered out


hello_starknet/simple_storage on  main [!?] via 🅒 base 
➜ source .env                                                  


hello_starknet/simple_storage on  main [!?] via 🅒 base 
➜ starkli declare target/dev/simple_storage_SimpleStorage.contract_class.json --account $STARKNET_ACCOUNT --rpc $STARKNET_RPC --keystore=$STARKNET_KEYSTORE
Enter keystore password: 
Sierra compiler version not specified. Attempting to automatically decide version to use...
Network detected: sepolia. Using the default compiler version for this network: 2.7.1. Use the --compiler-version flag to choose a different version.
Declaring Cairo 1 class: 0x01e9a661b206031409b5b267c47c0e72d2b0a2bb2064d17e45c9548d034735b0
Compiling Sierra class to CASM with compiler version 2.7.1...
CASM class hash: 0x0799123c8916798cf1ea653d9ea35d341e09b68dab822ededfebb79991603c6b
Contract declaration transaction: 0x07c8f684fd7c5921a29143c5d2da1cc59aff26e3b488a0aa278b7449d310203a
Class hash declared:
0x01e9a661b206031409b5b267c47c0e72d2b0a2bb2064d17e45c9548d034735b0

hello_starknet/simple_storage on  main [!?] via 🅒 base took 10.2s 
➜ starkli deploy 0x01e9a661b206031409b5b267c47c0e72d2b0a2bb2064d17e45c9548d034735b0 $ACCOUNT_ADDRESS --account $STARKNET_ACCOUNT --rpc $STARKNET_RPC --keystore=$STARKNET_KEYSTORE
Enter keystore password: 
Deploying class 0x01e9a661b206031409b5b267c47c0e72d2b0a2bb2064d17e45c9548d034735b0 with salt 0x046fb2d8fcb1da9ceca0e4ba3edcdfad20ab03529c632723e203335b79e7a654...
The contract will be deployed at address 0x0071f38cdc8425a5dc45c669938e8c50525eaaabe47584d169f5a1956986d53b
Error: TransactionExecutionError (tx index 0): Transaction execution has failed:
0: Error in the called contract (contract address: 0x077a47bd6896cc52cd980a402ac3937629bd0bf63da6c318ee0be3409cc2e129, class hash: 0x00816dd0297efc55dc1e7559020a3a825e81ef734b558f03c83325d4da7e6253, selector: 0x015d40a3d6ca2ac30f4031e42be28da9b056fef9bb7357ac5e85627ee876e5ad):
Error at pc=0:20259:
Cairo traceback (most recent call last):
Unknown location (pc=0:309)
Unknown location (pc=0:5819)
Unknown location (pc=0:11008)

1: Error in the called contract (contract address: 0x041a78e741e5af2fec34b695679bc6891742439f7afb8484ecd7766661ad02bf, class hash: 0x07b3e05f48f0c69e4a65ce5e076a66271a527aff2c34ce1083ec6e1526997a69, selector: 0x01987cbd17808b9a23693d4de7e246a443cfe37e6e7fbaeabd7d7e6532b07c3d):
Error at pc=0:32:
Cairo traceback (most recent call last):
Unknown location (pc=0:174)
Unknown location (pc=0:127)

2: Error in the contract class constructor (contract address: 0x0071f38cdc8425a5dc45c669938e8c50525eaaabe47584d169f5a1956986d53b, class hash: 0x01e9a661b206031409b5b267c47c0e72d2b0a2bb2064d17e45c9548d034735b0, selector: 0x028ffe4ff0f226a9107253e17a904099aa4f63a02a5621de0576e5aa71bc5194):
Execution failed. Failure reason: 0x4661696c656420746f20646573657269616c697a6520706172616d202331 ('Failed to deserialize param #1').

hello_starknet/simple_storage on  main [!?] via 🅒 base took 9.9s 
➜ starkli deploy --watch 0x01e9a661b206031409b5b267c47c0e72d2b0a2bb2064d17e45c9548d034735b0 20 $ACCOUNT_ADDRESS --account $STARKNET_ACCOUNT --rpc $STARKNET_RPC --keystore=$STARKNET_KEYSTORE
Enter keystore password: 
Deploying class 0x01e9a661b206031409b5b267c47c0e72d2b0a2bb2064d17e45c9548d034735b0 with salt 0x07989ecde15ab365337b0921f4ba8cfdb1b5dd969113afb3da997e5c53b6042e...
The contract will be deployed at address 0x01279b2950ecde226ef6e7dc625b65d38cd5eae4eec4b60a0ffad1feecf19b84
Contract deployment transaction: 0x02cebd3cb34c830b6e9e75a7acf5d502568fadfc47cd6103282603d4caa63789
Waiting for transaction 0x02cebd3cb34c830b6e9e75a7acf5d502568fadfc47cd6103282603d4caa63789 to confirm...
Transaction not confirmed yet...
Transaction 0x02cebd3cb34c830b6e9e75a7acf5d502568fadfc47cd6103282603d4caa63789 confirmed
Contract deployed:
0x01279b2950ecde226ef6e7dc625b65d38cd5eae4eec4b60a0ffad1feecf19b84

```

## 参考

- <https://foundry-rs.github.io/starknet-foundry/testing/coverage.html>
- <https://stackoverflow.com/questions/61936414/zsh-command-not-found-genhtml-flutter-code-coverage-using-codemagic>
- <https://github.com/software-mansion/cairo-coverage>
- <https://www.youtube.com/watch?v=9WdTv5N-6js&t=10s>
- <https://sepolia.voyager.online/contract/0x01279b2950ecde226ef6e7dc625b65d38cd5eae4eec4b60a0ffad1feecf19b84>
- <https://sepolia.voyager.online/contract/0x01279b2950ecde226ef6e7dc625b65d38cd5eae4eec4b60a0ffad1feecf19b84#accountCalls>
