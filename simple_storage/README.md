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


```

## 参考

- https://foundry-rs.github.io/starknet-foundry/testing/coverage.html
- https://stackoverflow.com/questions/61936414/zsh-command-not-found-genhtml-flutter-code-coverage-using-codemagic
- https://github.com/software-mansion/cairo-coverage
- https://www.youtube.com/watch?v=9WdTv5N-6js&t=10s
