# Calculator

## 实操

```bash
calculator on  main [?] via 🅒 base
➜ scarb test
     Running cairo-test calculator
   Compiling test(calculator_unittest) calculator v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/calculator/Scarb.toml)
    Finished `dev` profile target(s) in 2 seconds
testing calculator ...
running 8 tests
test calculator::calculator::tests::test_add2 ... ignored
test calculator::calculator::tests::test_div ... ok (gas usage est.: 188160)
test calculator::calculator::tests::test_pow2 ... ok (gas usage est.: 286880)
test calculator::calculator::tests::test_div_should_panic_when_divide_by_zero ... ok (gas usage est.: 4630)
test calculator::calculator::tests::test_sub ... ok (gas usage est.: 176670)
test calculator::calculator::tests::test_pow ... ok (gas usage est.: 286880)
test calculator::calculator::tests::test_add ... ok (gas usage est.: 176670)
test calculator::calculator::tests::test_mul ... ok (gas usage est.: 176670)
test result: ok. 7 passed; 0 failed; 1 ignored; 0 filtered out;


calculator on  main [?] via 🅒 base took 2.4s
➜ scarb cairo-test
   Compiling test(calculator_unittest) calculator v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/calculator/Scarb.toml)
    Finished `dev` profile target(s) in 2 seconds
testing calculator ...
running 8 tests
test calculator::calculator::tests::test_add2 ... ignored
test calculator::calculator::tests::test_add ... ok (gas usage est.: 176670)
test calculator::calculator::tests::test_mul ... ok (gas usage est.: 176670)
test calculator::calculator::tests::test_pow2 ... ok (gas usage est.: 286880)
test calculator::calculator::tests::test_sub ... ok (gas usage est.: 176670)
test calculator::calculator::tests::test_div_should_panic_when_divide_by_zero ... ok (gas usage est.: 4630)
test calculator::calculator::tests::test_div ... ok (gas usage est.: 188160)
test calculator::calculator::tests::test_pow ... ok (gas usage est.: 286880)
test result: ok. 7 passed; 0 failed; 1 ignored; 0 filtered out;

```
