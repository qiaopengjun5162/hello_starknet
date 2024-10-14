import { Account, RpcProvider, Contract, json } from "starknet";
import fs from 'fs';
import * as dotenv from "dotenv";
import abi from "./abi.json" with { type: "json" };
dotenv.config();

const provider = new RpcProvider({
  nodeUrl:
    "https://starknet-sepolia.g.alchemy.com/starknet/version/rpc/v0_7/wetra8HLzo_m-UswS8UJCnwdzS40X2wN",
});

const block_number = await provider.getBlockNumber();

console.log("Block number: " + block_number);

const accountAddress =
  "0x077a47bd6896cc52cd980a402ac3937629bd0bf63da6c318ee0be3409cc2e129";

const privateKey = process.env.PRIVATE_KEY;
const contractAddress = process.env.CONTRACT_ADDRESS;
const account = new Account(provider, accountAddress, privateKey);

const compiledTest = json.parse(
  fs.readFileSync("./abi.json").toString("ascii")
);

// console.log("ABI: ", abi);

const storageContract = new Contract(
  // compiledTest.abi,
  abi.abi,
  contractAddress,
  provider
);

let storageData = await storageContract.get_data();
console.log("Storage data: ", storageData.toString());

storageContract.connect(account);
const setCall = storageContract.populate('set_data', [25]);
const res = await storageContract.set_data(setCall.calldata,  { maxFee: 5_000_000_000_000 });
await provider.waitForTransaction(res.transaction_hash);
console.log("Transaction response: ", res);
const receipt = await provider.getTransactionReceipt(res.transaction_hash);
console.log("Transaction receipt: ", receipt);

storageData = await storageContract.get_data();
console.log("Storage data: ", storageData.toString());
