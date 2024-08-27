BEGIN {
    number = 600851475143;
    factor = 2;

    # Divide the number by the smallest factor (starting with 2)
    while (number > 1) {
        if (number % factor == 0) {
            # If 'factor' divides 'number', keep dividing it by 'factor'
            number /= factor;
        } else {
            # If 'factor' does not divide 'number', increment to the next possible factor
            factor++;
        }
    }

    print "The largest prime factor is:", factor;
}
