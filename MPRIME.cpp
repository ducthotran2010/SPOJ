#include <stdio.h>
#include <math.h>

using namespace std;

bool is_prime(long long n) {
    for (long long i = 2; i <= sqrt(n); ++i)
        if (n % i == 0) return false;
    return true;
}

int main()
{
    long long A[100000], B[5000];
    A[0] = 0;
    for (long i = 2; i <= (long) 2e5; ++i)
        if (is_prime(i)) A[++A[0]] = i;
    for (long i = 1; i <= A[0]; ++i) if (i % 2 == 1) {
        long long n = A[i];
        for (long m = A[i + 1]; m > 0; m /= 10)
            n *= 10;
        n += A[i + 1];
        if (is_prime(n)) B[++B[0]] = n;
    }
    long k;
    scanf("%ld", &k);
    printf("%lld", B[k]);
    return 0;
}
