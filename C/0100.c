#include <stdio.h>
#include <math.h>
#include <inttypes.h>

int main() {
    // The initial solutions (x, y) = (1, 1) corresponds to N=1, B=1, but P(BB)=0.
    // The next solution (7,5) gives N=4, B=3: P(BB) = 3/4 * 2/3 = 1/2.
    // We need to find the first N > 1e12.
    
    uint64_t x = 7;
    uint64_t y = 5;
    uint64_t N = 4; // (x + 1)/2 = (7+1)/2 =4
    uint64_t B = 3;  // (y + 1)/2 = (5+1)/2=3
    
    const uint64_t limit = 1000000000000ULL;
    
    while (N <= limit) {
        uint64_t next_x = 3 * x + 4 * y;
        uint64_t next_y = 2 * x + 3 * y;
        
        x = next_x;
        y = next_y;
        
        N = (x + 1) / 2;
        B = (y + 1) / 2;
    }
    
    printf("%" PRIu64 "\n", B);
    
    return 0;
}