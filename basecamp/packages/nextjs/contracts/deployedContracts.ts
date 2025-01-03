/**
 * This file is autogenerated by Scaffold-Stark.
 * You should not edit it manually or your changes might be overwritten.
 */

const deployedContracts = {
  devnet: {
    YourContract: {
      address:
        "0x4ca62955c3b645ee98ad49ecd3a56943c868e1eb409a2bc3eb7cf8c8724557f",
      abi: [
        {
          type: "impl",
          name: "YourContractImpl",
          interface_name: "contracts::YourContract::IYourContract",
        },
        {
          type: "struct",
          name: "core::byte_array::ByteArray",
          members: [
            {
              name: "data",
              type: "core::array::Array::<core::bytes_31::bytes31>",
            },
            {
              name: "pending_word",
              type: "core::felt252",
            },
            {
              name: "pending_word_len",
              type: "core::integer::u32",
            },
          ],
        },
        {
          type: "struct",
          name: "core::integer::u256",
          members: [
            {
              name: "low",
              type: "core::integer::u128",
            },
            {
              name: "high",
              type: "core::integer::u128",
            },
          ],
        },
        {
          type: "enum",
          name: "core::bool",
          variants: [
            {
              name: "False",
              type: "()",
            },
            {
              name: "True",
              type: "()",
            },
          ],
        },
        {
          type: "interface",
          name: "contracts::YourContract::IYourContract",
          items: [
            {
              type: "function",
              name: "greeting",
              inputs: [],
              outputs: [
                {
                  type: "core::byte_array::ByteArray",
                },
              ],
              state_mutability: "view",
            },
            {
              type: "function",
              name: "set_greeting",
              inputs: [
                {
                  name: "new_greeting",
                  type: "core::byte_array::ByteArray",
                },
                {
                  name: "amount_eth",
                  type: "core::integer::u256",
                },
              ],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "withdraw",
              inputs: [],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "premium",
              inputs: [],
              outputs: [
                {
                  type: "core::bool",
                },
              ],
              state_mutability: "view",
            },
          ],
        },
        {
          type: "impl",
          name: "OwnableImpl",
          interface_name: "openzeppelin_access::ownable::interface::IOwnable",
        },
        {
          type: "interface",
          name: "openzeppelin_access::ownable::interface::IOwnable",
          items: [
            {
              type: "function",
              name: "owner",
              inputs: [],
              outputs: [
                {
                  type: "core::starknet::contract_address::ContractAddress",
                },
              ],
              state_mutability: "view",
            },
            {
              type: "function",
              name: "transfer_ownership",
              inputs: [
                {
                  name: "new_owner",
                  type: "core::starknet::contract_address::ContractAddress",
                },
              ],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "renounce_ownership",
              inputs: [],
              outputs: [],
              state_mutability: "external",
            },
          ],
        },
        {
          type: "constructor",
          name: "constructor",
          inputs: [
            {
              name: "owner",
              type: "core::starknet::contract_address::ContractAddress",
            },
          ],
        },
        {
          type: "event",
          name: "openzeppelin_access::ownable::ownable::OwnableComponent::OwnershipTransferred",
          kind: "struct",
          members: [
            {
              name: "previous_owner",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
            {
              name: "new_owner",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
          ],
        },
        {
          type: "event",
          name: "openzeppelin_access::ownable::ownable::OwnableComponent::OwnershipTransferStarted",
          kind: "struct",
          members: [
            {
              name: "previous_owner",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
            {
              name: "new_owner",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
          ],
        },
        {
          type: "event",
          name: "openzeppelin_access::ownable::ownable::OwnableComponent::Event",
          kind: "enum",
          variants: [
            {
              name: "OwnershipTransferred",
              type: "openzeppelin_access::ownable::ownable::OwnableComponent::OwnershipTransferred",
              kind: "nested",
            },
            {
              name: "OwnershipTransferStarted",
              type: "openzeppelin_access::ownable::ownable::OwnableComponent::OwnershipTransferStarted",
              kind: "nested",
            },
          ],
        },
        {
          type: "event",
          name: "contracts::YourContract::YourContract::GreetingChanged",
          kind: "struct",
          members: [
            {
              name: "greeting_setter",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
            {
              name: "new_greeting",
              type: "core::byte_array::ByteArray",
              kind: "key",
            },
            {
              name: "premium",
              type: "core::bool",
              kind: "data",
            },
            {
              name: "value",
              type: "core::integer::u256",
              kind: "data",
            },
          ],
        },
        {
          type: "event",
          name: "contracts::YourContract::YourContract::Event",
          kind: "enum",
          variants: [
            {
              name: "OwnableEvent",
              type: "openzeppelin_access::ownable::ownable::OwnableComponent::Event",
              kind: "flat",
            },
            {
              name: "GreetingChanged",
              type: "contracts::YourContract::YourContract::GreetingChanged",
              kind: "nested",
            },
          ],
        },
      ],
      classHash:
        "0x2900465e2b29becd029ba2d0cecfb799528347bd2259eb5c6aa2489a8de19f5",
    },
    Counter: {
      address:
        "0x767aa2726f4c3790688ed692cca10f305611ab03ac360fb3877ef0c5f18285d",
      abi: [
        {
          type: "impl",
          name: "CounterImpl",
          interface_name: "contracts::Counter::ICounter",
        },
        {
          type: "struct",
          name: "core::integer::u256",
          members: [
            {
              name: "low",
              type: "core::integer::u128",
            },
            {
              name: "high",
              type: "core::integer::u128",
            },
          ],
        },
        {
          type: "interface",
          name: "contracts::Counter::ICounter",
          items: [
            {
              type: "function",
              name: "get_counter",
              inputs: [],
              outputs: [
                {
                  type: "core::integer::u256",
                },
              ],
              state_mutability: "view",
            },
            {
              type: "function",
              name: "increment",
              inputs: [],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "decrement",
              inputs: [],
              outputs: [],
              state_mutability: "external",
            },
          ],
        },
        {
          type: "constructor",
          name: "constructor",
          inputs: [
            {
              name: "initial_counter",
              type: "core::integer::u256",
            },
          ],
        },
        {
          type: "function",
          name: "increment_five",
          inputs: [],
          outputs: [],
          state_mutability: "external",
        },
        {
          type: "event",
          name: "contracts::Counter::Counter::CounterIncremented",
          kind: "struct",
          members: [
            {
              name: "counter",
              type: "core::integer::u256",
              kind: "data",
            },
          ],
        },
        {
          type: "event",
          name: "contracts::Counter::Counter::CounterDecremented",
          kind: "struct",
          members: [
            {
              name: "counter",
              type: "core::integer::u256",
              kind: "data",
            },
          ],
        },
        {
          type: "event",
          name: "contracts::Counter::Counter::Event",
          kind: "enum",
          variants: [
            {
              name: "CounterIncremented",
              type: "contracts::Counter::Counter::CounterIncremented",
              kind: "nested",
            },
            {
              name: "CounterDecremented",
              type: "contracts::Counter::Counter::CounterDecremented",
              kind: "nested",
            },
          ],
        },
      ],
      classHash:
        "0x21e4f6b090d421213b8a90ed26a31d7178fe26c220497e003583abeb23b850e",
    },
    CrowdFund: {
      address:
        "0xba4bfe7b6d32c99fc4a108838b717c208537a487611ae625f46d56fcf6771a",
      abi: [
        {
          type: "impl",
          name: "CroundFundImpl",
          interface_name: "contracts::CrowdFund::ICrowdFund",
        },
        {
          type: "struct",
          name: "core::integer::u256",
          members: [
            {
              name: "low",
              type: "core::integer::u128",
            },
            {
              name: "high",
              type: "core::integer::u128",
            },
          ],
        },
        {
          type: "enum",
          name: "core::bool",
          variants: [
            {
              name: "False",
              type: "()",
            },
            {
              name: "True",
              type: "()",
            },
          ],
        },
        {
          type: "struct",
          name: "contracts::CrowdFund::CrowdFund::Campaign",
          members: [
            {
              name: "creator",
              type: "core::starknet::contract_address::ContractAddress",
            },
            {
              name: "goal",
              type: "core::integer::u256",
            },
            {
              name: "amount_donated",
              type: "core::integer::u256",
            },
            {
              name: "end_at",
              type: "core::integer::u256",
            },
            {
              name: "claimed",
              type: "core::bool",
            },
          ],
        },
        {
          type: "interface",
          name: "contracts::CrowdFund::ICrowdFund",
          items: [
            {
              type: "function",
              name: "create_campaign",
              inputs: [
                {
                  name: "end_at",
                  type: "core::integer::u256",
                },
                {
                  name: "goal",
                  type: "core::integer::u256",
                },
              ],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "donate",
              inputs: [
                {
                  name: "campaign_id",
                  type: "core::integer::u256",
                },
                {
                  name: "amount",
                  type: "core::integer::u256",
                },
              ],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "claim",
              inputs: [
                {
                  name: "campaign_id",
                  type: "core::integer::u256",
                },
              ],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "redeem",
              inputs: [
                {
                  name: "campaign_id",
                  type: "core::integer::u256",
                },
              ],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "get_campaign",
              inputs: [
                {
                  name: "campaign_id",
                  type: "core::integer::u256",
                },
              ],
              outputs: [
                {
                  type: "contracts::CrowdFund::CrowdFund::Campaign",
                },
              ],
              state_mutability: "view",
            },
            {
              type: "function",
              name: "get_user_donations",
              inputs: [
                {
                  name: "campaign_id",
                  type: "core::integer::u256",
                },
                {
                  name: "user_address",
                  type: "core::starknet::contract_address::ContractAddress",
                },
              ],
              outputs: [
                {
                  type: "core::integer::u256",
                },
              ],
              state_mutability: "view",
            },
          ],
        },
        {
          type: "impl",
          name: "OwnableImpl",
          interface_name: "openzeppelin_access::ownable::interface::IOwnable",
        },
        {
          type: "interface",
          name: "openzeppelin_access::ownable::interface::IOwnable",
          items: [
            {
              type: "function",
              name: "owner",
              inputs: [],
              outputs: [
                {
                  type: "core::starknet::contract_address::ContractAddress",
                },
              ],
              state_mutability: "view",
            },
            {
              type: "function",
              name: "transfer_ownership",
              inputs: [
                {
                  name: "new_owner",
                  type: "core::starknet::contract_address::ContractAddress",
                },
              ],
              outputs: [],
              state_mutability: "external",
            },
            {
              type: "function",
              name: "renounce_ownership",
              inputs: [],
              outputs: [],
              state_mutability: "external",
            },
          ],
        },
        {
          type: "constructor",
          name: "constructor",
          inputs: [
            {
              name: "eth_address",
              type: "core::starknet::contract_address::ContractAddress",
            },
          ],
        },
        {
          type: "event",
          name: "contracts::CrowdFund::CrowdFund::CampaignDonated",
          kind: "struct",
          members: [
            {
              name: "campaign_id",
              type: "core::integer::u256",
              kind: "key",
            },
            {
              name: "creator",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
            {
              name: "goal",
              type: "core::integer::u256",
              kind: "data",
            },
            {
              name: "end_at",
              type: "core::integer::u256",
              kind: "data",
            },
          ],
        },
        {
          type: "event",
          name: "openzeppelin_access::ownable::ownable::OwnableComponent::OwnershipTransferred",
          kind: "struct",
          members: [
            {
              name: "previous_owner",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
            {
              name: "new_owner",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
          ],
        },
        {
          type: "event",
          name: "openzeppelin_access::ownable::ownable::OwnableComponent::OwnershipTransferStarted",
          kind: "struct",
          members: [
            {
              name: "previous_owner",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
            {
              name: "new_owner",
              type: "core::starknet::contract_address::ContractAddress",
              kind: "key",
            },
          ],
        },
        {
          type: "event",
          name: "openzeppelin_access::ownable::ownable::OwnableComponent::Event",
          kind: "enum",
          variants: [
            {
              name: "OwnershipTransferred",
              type: "openzeppelin_access::ownable::ownable::OwnableComponent::OwnershipTransferred",
              kind: "nested",
            },
            {
              name: "OwnershipTransferStarted",
              type: "openzeppelin_access::ownable::ownable::OwnableComponent::OwnershipTransferStarted",
              kind: "nested",
            },
          ],
        },
        {
          type: "event",
          name: "contracts::CrowdFund::CrowdFund::Event",
          kind: "enum",
          variants: [
            {
              name: "CampaignDonated",
              type: "contracts::CrowdFund::CrowdFund::CampaignDonated",
              kind: "nested",
            },
            {
              name: "OwnableEvent",
              type: "openzeppelin_access::ownable::ownable::OwnableComponent::Event",
              kind: "flat",
            },
          ],
        },
      ],
      classHash:
        "0x2de7a6685214ca42ac204285ac44c0d9fe29d6af4fb4dfdd921fbef38fec8e8",
    },
  },
} as const;

export default deployedContracts;
