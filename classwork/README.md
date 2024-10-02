# Classwork 



## 实操

### 创建项目

```bash
scarb new classwork
cd classwork
code .
```

### 项目目录结构

```bash
hello_starknet/classwork on  main [?] via 🅒 base 
➜ tree . -L 6 -I 'target|coverage|coverage_report|snfoundry_trace'


.
├── README.md
├── Scarb.lock
├── Scarb.toml
└── src
    └── lib.cairo

2 directories, 4 files

```

### 代码

#### `Scarb.toml` 文件

```toml
[package]
name = "classwork"
version = "0.1.0"
edition = "2024_07"

# See more keys and their definitions at https://docs.swmansion.com/scarb/docs/reference/manifest.html

[dependencies]

[dev-dependencies]
cairo_test = "2.8.2"

```



#### `lib.cairo` 文件

```rust
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

```

### 运行

```bash
hello_starknet/classwork on  main [?] via 🅒 base 
➜ scarb cairo-run      
   Compiling classwork v0.1.0 (/Users/qiaopengjun/Code/starknet-code/hello_starknet/classwork/Scarb.toml)
    Finished release target(s) in 2 seconds
     Running classwork
Hello, world!
num is 3
The value of x is: 5
The value of x is: 6
Run completed successfully, returning []

```







## 总结



## 参考

- https://www.youtube.com/watch?v=VG8LOsWgFug