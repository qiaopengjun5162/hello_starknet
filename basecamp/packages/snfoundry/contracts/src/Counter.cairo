#[starknet::interface]
trait ICounter<TContractState> {
    // Returns the current counter value
    fn get_counter(self: @TContractState) -> u256;
    // Increments the counter by a specified amount
    fn increment(ref self: TContractState);
    // Decrements the counter by a specified amount
    fn decrement(ref self: TContractState);
}

#[starknet::contract]
mod Counter {
    use super::ICounter;
    #[storage]
    // Storage structure for the contract
    struct Storage {
        counter: u256 // The counter value
    }

    // Defines the events that can be emitted by the Counter contract
    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        CounterIncremented: CounterIncremented, // Event emitted when the counter is incremented
        CounterDecremented: CounterDecremented, // Event emitted when the counter is decremented
    }

    #[derive(Drop, starknet::Event)]
    struct CounterIncremented {
        counter: u256,
    }

    #[derive(Drop, starknet::Event)]
    struct CounterDecremented {
        counter: u256,
    }

    #[constructor]
    // Constructor function to initialize the contract
    fn constructor(ref self: ContractState, initial_counter: u256) {
        self.counter.write(initial_counter); // Sets the initial counter value
    }

    #[abi(embed_v0)]
    // Implementation of the ICounter interface
    impl CounterImpl of ICounter<ContractState> {
        // Returns the current counter value
        fn get_counter(self: @ContractState) -> u256 {
            self.counter.read()
        }
        // Increments the counter by 1 and emits an event
        fn increment(ref self: ContractState) {
            self._increment(1);
            self.emit(CounterIncremented { counter: 1 });
        }
        // Decrements the counter by 1 and emits an event
        fn decrement(ref self: ContractState) {
            self._decrement(1);
            self.emit(CounterDecremented { counter: 1 });
        }
    }

    #[external(v0)]
    // External function to increment the counter by 5 and emits an event
    fn increment_five(ref self: ContractState) {
        self._increment(5);
        self.emit(CounterIncremented { counter: 5 });
    }

    #[generate_trait]
    // Private trait implementation for increment and decrement operations
    impl Private of PrivateTrait {
        // Private function to increment the counter by a specified amount
        fn _increment(ref self: ContractState, amount: u256) {
            self.counter.write(self.counter.read() + amount)
        }

        // Private function to decrement the counter by a specified amount
        fn _decrement(ref self: ContractState, amount: u256) {
            self.counter.write(self.counter.read() - amount)
        }
    }
}
