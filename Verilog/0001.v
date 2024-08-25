module sum_multiples;

    reg [31:0] total_sum; // 32-bit register to store the total sum
    reg [31:0] i; // 32-bit register to iterate through numbers

    // Initial block to execute the logic
    initial begin
        total_sum = 0; // Initialize total_sum to 0

        // Iterate from 1 to 999
        for (i = 1; i < 1000; i = i + 1) begin
            // Check if i is a multiple of 3 or 5
            if ((i % 3 == 0) || (i % 5 == 0)) begin
                total_sum = total_sum + i; // Add to total_sum
            end
        end

        // Display the result
        $display("The sum of all multiples of 3 or 5 below 1000 is: %d", total_sum);
        
        // End the simulation
        $finish;
    end

endmodule
