#include <iostream>
#define MAXN 60010
using namespace std;

long n;

namespace Fenwick{
    long long BIT[MAXN * 2];

    void update(long x) {
        while (x <= MAXN) {
            BIT[x] += 1;
            x += x & -x;
    }}

    long long getV(long x) {
        long long result = 0;
        while (x > 0) {
            result += BIT[x];
            x -= x & -x;
        }
        return result;
    }
}

int main()
{
    long long result = 0;
    scanf("%ld", &n);
    for (long i = 0; i < n; ++i) {
        long value;
        scanf("%ld", &value);
        Fenwick::update(value);
        result += Fenwick::getV(MAXN) - Fenwick::getV(value);
    }
    printf("%lld", result);

    return 0;
}
