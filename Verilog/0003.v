module largest_prime_factor;

// Input number (64-bit)
reg [63:0] n = 600851475143;
reg [63:0] max_prime = 0;

reg [63:0] i;
reg [63:0] temp;

initial begin
    $display("Computing largest prime factor of %0d", n);

    // Step 1: Remove all factors of 2
    while (n % 2 == 0) begin
        max_prime = 2;
        n = n / 2;
    end

    // Step 2: Try odd factors from 3 upwards
    i = 3;
    while (i * i <= n) begin
        while (n % i == 0) begin
            max_prime = i;
            n = n / i;
        end
        i = i + 2;
    end

    // Step 3: If remaining n > 2, then it's a prime
    if (n > 2)
        max_prime = n;

    $display("The largest prime factor is %0d", max_prime);
    $finish;
end

endmodule