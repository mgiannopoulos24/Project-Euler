function largestPrimeFactor(n) {
    let largest = 0n;

    while (n % 2n === 0n) {
        largest = 2n;
        n = n / 2n;
    }

    for (let i = 3n; i * i <= n; i += 2n) {
        while (n % i === 0n) {
            largest = i;
            n = n / i;
        }
    }

    if (n > 2n) {
        largest = n;
    }

    return largest;
}

const number = 600851475143n;
const result = largestPrimeFactor(number);
console.log(`The largest prime factor of ${number} is ${result}`);