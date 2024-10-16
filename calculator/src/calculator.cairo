pub fn add(x: i64, y: i64) -> i64 {
    x + y
}

pub fn mul(x: i64, y: i64) -> i64 {
    x * y
}

// x / y
pub fn div(x: i64, y: i64) -> i64 {
    x / y
}

pub fn sub(x: i64, y: i64) -> i64 {
    x - y
}

// x ** y
pub fn pow(x: i64, y: i64) -> i64 {
    let mut i = 0;
    let mut val: i64 = 1;

    let res: i64 = loop {
        if i == y {
            break val;
        }
        val *= x;
        i += 1
    };

    res
}

#[cfg(test)]
mod tests {
    use super::{add, mul, div, pow, sub};

    #[test]
    fn test_add() {
        assert_eq!(add(5, 5), 10);
        assert_eq!(add(-5, 5), 0);
        assert_eq!(add(-5, -5), -10);
    }

    #[test]
    #[ignore]
    fn test_add2() {
        assert_eq!(add(5, 5), 10);
        assert!(add(5, 5) == 10, "add returns unexpected res");
        assert_lt!(add(4, 3), 8, "res should be lt 8");
    }

    #[test]
    fn test_sub() {
        assert_eq!(sub(5, 5), 0);
        assert_eq!(sub(-5, 5), -10);
        assert_eq!(sub(-5, -5), 0);
    }

    #[test]
    fn test_mul() {
        assert_eq!(mul(5, 5), 25);
        assert_eq!(mul(-5, 5), -25);
        assert_eq!(mul(-5, -5), 25);
    }

    #[test]
    #[should_panic(expected: 'Division by 0')]
    fn test_div_should_panic_when_divide_by_zero() {
        div(10, 0);
    }

    #[test]
    fn test_div() {
        assert_eq!(div(10, 2), 5);
        assert_eq!(div(-10, 2), -5);
        assert_eq!(div(-10, -2), 5);
    }

    #[test]
    #[available_gas(2000000)]
    fn test_pow() {
        assert_eq!(pow(2, 10), 1024);
        assert_eq!(pow(-2, 10), 1024);
        assert_eq!(pow(-2, 11), -2048);
    }

    #[test]
    #[available_gas(2000000)]
    fn test_pow2() {
        assert!(pow(2, 10) == 1024, "Failed to pow val");
        assert_eq!(pow(2, 10), 1024);
        assert_eq!(pow(-2, 10), 1024);
        assert_eq!(pow(-2, 11), -2048);
    }
}
