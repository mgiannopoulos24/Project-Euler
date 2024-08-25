fn sum_of_multiples(limit: u32) -> u32 {
    let mut total_sum = 0;
    for i in 1..limit {
        if i % 3 == 0 || i % 5 == 0 {
            total_sum += i;
        }
    }
    total_sum
}

fn main() {
    let limit = 1000;
    let result = sum_of_multiples(limit);
    println!("The sum of all multiples of 3 or 5 below {} is: {}", limit, result);
}
