#include <stdio.h>
#include <stdlib.h>


long long a, b, L, res1, res2, res3;
//typedef long factor[21];

void toFactor(long tmp[], long n)
{
    long i = 2;
    if (n == 0) {tmp[0] = 0;return 0;};
    if (n == 1) {tmp[0] = 1; tmp[1] = 1; return 0;};
    tmp[0] = 0;
    while (n != 1)
        if (n % i == 0)
        {
            tmp[0] += 1;
            tmp[tmp[0]] = i;
            while (n % i == 0) n /= i;
        }
        else i++;
    //printf("%d %d", tmp[0], tmp[1]);
}

long long countSeen(const long d[])
{
    long long res = L, tmp = 1, k[21]; k[0] = 0;
    void try(int i)
    {
        int j;
        for (j = k[i - 1] + 1; j <= d[0]; j++)
        {
            tmp *= d[j];
            k[i] = j;
            if (i%2) res -= L/tmp; else res += L/tmp;
            if (j < d[0]) try(i + 1);
            tmp /= d[j];
        }
    }
    if (d[0] == 0) return 1;
    if (d[1] != 1) try(1);
    return res;
}

void bothFactor(long a[], long b[], long tmp[])
{
    if (a[0] * b[0] == 0) {tmp[0] = 0; return 0;}
    if (a[1] == 1) {memcpy(tmp, b, sizeof(long) * 21); return 0;};
    if (b[1] == 1) {memcpy(tmp, a, sizeof(long) * 21); return 0;};
    long i = 1, j = 1;
    tmp[0] = 0;
    b[b[0] + 1] = 1000000000;
    a[a[0] + 1] = 1000000000;
    while ((i <= a[0]) || (j <= b[0]))
    {
        if (a[i] <= b[j])
        {
            tmp[0]++;
            tmp[tmp[0]] = a[i];
            if (a[i] == b[j]) j++; i++;
        }
        else
        {
            tmp[0]++;
            tmp[tmp[0]] = b[j];
            j++;
        }
    }
}

int solve(void)
{
    long i, tmpF1[21], tmpF2[21], tmpF12[21], t1, t2;
    for (i = -a; i <= b; i++)
    {
        toFactor(tmpF1, b - i);
        toFactor(tmpF2, i + a);
        bothFactor(tmpF1, tmpF2, tmpF12);
        t1 = countSeen(tmpF12);
        t2 = countSeen(tmpF1) + countSeen(tmpF2) - t1 * 2;
        res3 += t1;
        res2 += t2;
        res1 += L - t1 - t2;
        //printf("%d %d %d\n\n", t1 + t2 - t12, 2 * t12 - t1 - t2, L - t12);
    }
}

int main(void)
{
    scanf("%lld %lld\n%lld", &a, &b, &L);
    if (a + b == 0) {res1 = L - 1; res3 = 1;}
    else if (a + b == 1) {res2 = 2 * (L - 1); res3 = 2;}
    else solve();
    printf("%lld\n%lld\n%lld", res1, res2, res3);
    return 0;
}

