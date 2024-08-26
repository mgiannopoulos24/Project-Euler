module fibonacci_sum(
    output reg [31:0] sum  // Output for the sum of even-valued Fibonacci numbers
);

    // Internal registers
    reg [31:0] a;           // Current Fibonacci number
    reg [31:0] b;           // Next Fibonacci number
    reg [31:0] even_sum;   // Sum of even-valued Fibonacci numbers
    reg [31:0] limit;      // Limit for Fibonacci sequence
    
    // Initialization and computation
    initial begin
        // Initialize variables
        a = 1;
        b = 2;
        even_sum = 0;
        limit = 4000000;

        // Compute the sum of even Fibonacci numbers
        while (a <= limit) begin
            if (a % 2 == 0) begin
                even_sum = even_sum + a;
            end

            // Update Fibonacci numbers
            {a, b} = {b, a + b};
        end

        // Set the output
        sum = even_sum;
        // Display the result
        $display("The sum of the even-valued terms is: %d", sum);
        
        // Finish the simulation
        $finish;
    end
endmodule
