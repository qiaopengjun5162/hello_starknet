fn main() {
    println!("Hello, world!");
    call_me(3);

    let mut x = 5;
    println!("The value of x is: {}", x);
    x = 6;
    println!("The value of x is: {}", x);
}

fn call_me(num: felt252) {
    println!("num is {}", num);
}
