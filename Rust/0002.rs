fn sum_even_fibonacci(limit: u32) -> u32 {
    let mut a = 1;
    let mut b = 2;
    let mut even_sum = 0;

    while a <= limit {
        if a % 2 == 0 {
            even_sum += a;
        }
        let next = a + b;
        a = b;
        b = next;
    }

    even_sum
}

fn main() {
    // Define the limit (4 million)
    let limit = 4_000_000;

    // Calculate the sum of even-valued Fibonacci numbers
    let result = sum_even_fibonacci(limit);

    // Print the result
    println!("The sum of the even-valued terms is: {}", result);
}
