#import <Foundation/Foundation.h>

int sumOfMultiples(int limit) {
    int sum = 0;
    for (int i = 1; i < limit; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
            sum += i;
        }
    }
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int limit = 1000;
        int result = sumOfMultiples(limit);
        NSLog(@"The sum of all multiples of 3 or 5 below %d is: %d", limit, result);
    }
    return 0;
}
