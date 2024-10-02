# Simple Counter

## 实操

### 项目创建

```bash

hello_starknet on  main [?] via 🅒 base
➜
snforge --version
sncast --version

snforge 0.31.0
sncast 0.31.0

hello_starknet on  main [?] via 🅒 base
➜
scarb --version
scarb 2.8.2 (a37b4cbfc 2024-09-09)
cairo: 2.8.2 (https://crates.io/crates/cairo-lang-compiler/2.8.2)
sierra: 1.6.0


hello_starknet on  main [?] via 🅒 base
➜
snforge init simple_counter
Created `simple_counter` package.
    Removing cairo_test from dev-dependencies
    Updating git repository https://github.com/foundry-rs/starknet-foundry

hello_starknet on  main [?] via 🅒 base took 19.0s
➜
ls
README.md      classwork      hello_cairo    hellostarknet  simple_counter starknet_erc20
classroom      crossinteract  hello_world    ownable        simple_storage test-cairo

hello_starknet on  main [?] via 🅒 base
➜
cd simple_counter/

simple_counter on  main [?] via 🅒 base
➜
open -a cursor .

simple_counter on  main [?] via 🅒 base
➜


simple_counter on  main [?] via 🅒 base took 10.3s 
➜ scarb fmt && scarb build
   Compiling snforge_scarb_plugin v0.31.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.31.0#72ea785ca354e9e506de3e5d687da9fb2c1b3c67)
    Finished `release` profile [optimized] target(s) in 0.10s
   Compiling simple_counter v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/simple_counter/Scarb.toml)
    Finished release target(s) in 3 seconds

simple_counter on  main [?] via 🅒 base took 3.1s 
➜ scarb test              
     Running test simple_counter (snforge test)
   Compiling snforge_scarb_plugin v0.31.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.31.0#72ea785ca354e9e506de3e5d687da9fb2c1b3c67)
    Finished `release` profile [optimized] target(s) in 0.11s
   Compiling simple_counter v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/simple_counter/Scarb.toml)
    Finished release target(s) in 3 seconds
   Compiling snforge_scarb_plugin v0.31.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.31.0#72ea785ca354e9e506de3e5d687da9fb2c1b3c67)
    Finished `release` profile [optimized] target(s) in 0.10s
   Compiling test(simple_counter_unittest) simple_counter v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/simple_counter/Scarb.toml)
   Compiling test(simple_counter_integrationtest) simple_counter_integrationtest v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/simple_counter/Scarb.toml)
    Finished release target(s) in 6 seconds


Collected 5 test(s) from simple_counter package
Running 0 test(s) from src/
Running 5 test(s) from tests/
[PASS] simple_counter_integrationtest::test_contract::test_initial_count (gas: ~103)
[PASS] simple_counter_integrationtest::test_contract::test_increment_overflow (gas: ~167)
[PASS] simple_counter_integrationtest::test_contract::test_decrement_underflow (gas: ~103)
[PASS] simple_counter_integrationtest::test_contract::test_decrement (gas: ~175)
[PASS] simple_counter_integrationtest::test_contract::test_increment (gas: ~175)
Tests: 5 passed, 0 failed, 0 skipped, 0 ignored, 0 filtered out

```
