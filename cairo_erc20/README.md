# cairo_erc20

## 实操

```shell
cd Code/cairo/
ls
scarb new cairo_erc20
scarb test
scarb --version
scarb fmt
```

## 部署合约

```shell
scarb test
scarb build
starkli -V
curl https://get.starkli.sh | sh
. /Users/qiaopengjun/.starkli/env
starkliup -v v0.2.4

export STARKNET_KEYSTORE=~/.starknet_accounts/key.json
export STARKNET_RPC=https://starknet-testnet.public.blastapi.io/rpc/v0_6
export STARKNET_ACCOUNT=~/.starknet_accounts/starkli.json
starkli declare target/dev/cairo_erc20_ERC20.contract_class.json
starkli deploy 0x0072cf3b153c54ed302de296a0ef1db03a845fc50f00214652c2e4bd9c97af6d str:HELLO str:HE 18
starkli call 0x04c970122f8111206f10bc9f90e1bf8fbd58d7ec90233347238d422b581171de name
starkli -h
starkli parse-cairo-string 0x00000000000000000000000000000000000000000000000000000048454c4c4f
```

## 参考

- <https://testnet.starkscan.co/tx/0x05c7afc9f0437e96a7270c9aea449af8919b873756ade4df7e53bdfe11dbf23c>
- <https://goerli.voyager.online/tx/0x5c7afc9f0437e96a7270c9aea449af8919b873756ade4df7e53bdfe11dbf23c>
