const std = @import("std");

pub fn main() !void {
    var total_sum: usize = 0;
    
    // Loop through all numbers from 1 to 999
    for (1..1000) |i| {
        if (i % 3 == 0 or i % 5 == 0) {
            total_sum += i;
        }
    }
    
    // Print the result
    std.debug.print("The sum of all multiples of 3 or 5 below 1000 is: {}\n", .{total_sum});
}