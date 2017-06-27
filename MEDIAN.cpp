#include <stdio.h>
#include <string.h>


using namespace std;

long n, BIT[70000 * 2], k;

void update_BIT(long x, const long v) {
    while (x <= 65537) {
        BIT[x] += v;
        x += x & -x;
    }
}
long getV_BIT(long x) {
    long res = 0;
    while (x) {
        res += BIT[x];
        x -= x & -x;
    }
    return res;
}
long long searching() {
    long Lo = 0, Hi = 65536, res;
    while (Lo <= Hi) {
        long midV = (Lo + Hi) >> 1;
        if (getV_BIT(midV + 1) >= (k + 1)/2) {
            res = midV;
            Hi = midV - 1;
        } else Lo = midV + 1;
    }
    return res;
}
int main() {
    long long res;
    long t, numCase = 0, seed, mul, add, a[250010];
    scanf("%ld", &t);
    while(t--) {
        scanf("%ld%ld%ld%ld%ld", &seed, &mul, &add, &n, &k);

        a[1] = seed;// printf("%ld ", a[1]);
        for (long i = 2; i <= n; i++) {
            a[i] = ((long long)a[i - 1] * mul + add)%65536;
            //printf("%ld ", a[i]);
        } //printf("-\n");
        memset(BIT, 0, sizeof(BIT));
        for (long i = 1; i <= k; i++) update_BIT(a[i] + 1, 1);
        res = searching();
        for (long i = k + 1; i <= n; i++) {
            update_BIT(a[i] + 1, 1);
            update_BIT(a[i - k] + 1, -1);
            //printf("%ld ", searching());
            res += searching();
            }
        printf("Case #%ld: %lld\n", ++numCase, res);
    }
    return 0;
}
