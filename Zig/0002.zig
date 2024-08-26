const std = @import("std");

fn sum_even_fibonacci(limit: u32) u32 {
    var a: u32 = 1;
    var b: u32 = 2;
    var even_sum: u32 = 0;

    while (a <= limit) {
        if (a % 2 == 0) {
            even_sum += a;
        }
        const next = a + b;
        a = b;
        b = next;
    }

    return even_sum;
}

pub fn main() !void {
    const limit: u32 = 4_000_000;
    const result = sum_even_fibonacci(limit);

    std.debug.print("The sum of the even-valued terms is: {}\n", .{result});
}
