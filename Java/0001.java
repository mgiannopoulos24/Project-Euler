public class SumMultiples {
    public static void main(String[] args) {
        int sum = 0;

        // Loop through numbers from 1 to 999
        for (int i = 1; i < 1000; i++) {
            // Check if the number is a multiple of 3 or 5
            if (i % 3 == 0 || i % 5 == 0) {
                sum += i;
            }
        }

        // Print the result
        System.out.println("The sum of all multiples of 3 or 5 below 1000 is: " + sum);
    }
}
