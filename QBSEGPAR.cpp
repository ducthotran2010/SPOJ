#include <iostream>
#include <stdio.h>
#include <algorithm>
#define MAXN 15050
#define INF 1<<30
using namespace std;

struct indexed {long value, location, type;};
bool isGetMin;
indexed B[MAXN<<1];
long a[MAXN], S[MAXN], F[MAXN], Location[MAXN][2], BIT[MAXN<<1];
long L = 0, H = 0, res, n, N, k;

bool compare(const indexed a, const indexed b) {return a.value > b.value;}
void init(const long M)
{
    N = n<<1;
    B[0].value = 0; B[0].location = 0; B[0].type = 0;
    for (int i = 1; i <= n; i++)
    {
        B[i].value = S[i]; B[i].location = i; B[i].type = 0;
        B[i + n].value = S[i] - M; B[i + n].location = i; B[i + n].type = 1;
    }
    sort(B, B + N + 1, compare);
    long s = 0, vbefore = INF;
    for (int i = 0; i <= N; i++)
    {
        if (B[i].value != vbefore) s++;
        Location[B[i].location][B[i].type] = s;
        BIT[i] = (isGetMin) ? INF : -INF;
        vbefore = B[i].value;
    }
}
void update(long x, const long value)
{
    while (x <= N+1)
    {
        BIT[x] = (isGetMin) ? min(BIT[x], value) : max(BIT[x], value);
        x += x & -x;
    }
}
long getV(long x)
{
    long res = (isGetMin) ? INF : -INF;
    while (x > 0)
    {
        res = (isGetMin) ? min(BIT[x], res) : max(BIT[x], res);
        x -= x & -x;
    }
    return res;
}
long getNumberGroups()
{
    update(Location[0][0], 0);
    for (int i = 1; i <= n; i++)
    {
        F[i] = getV(Location[i][1]) + 1;
        update(Location[i][0], F[i]);
    }
    return F[n];
}

int main()
{
    scanf("%ld%ld", &n, &k);
    for (int i = 1; i <= n; i++)
    {
        scanf("%ld", &a[i]);
        if (a[i] > 0) H += a[i]; else L += a[i];
    }

    S[0] = 0; res = H;
    for (int i = 1; i <= n; i++) S[i] = S[i - 1] + a[i];

    while (L <= H)
    {
        long M = (L + H) >> 1;
        isGetMin = true;  init(M); long x = getNumberGroups();
        isGetMin = false; init(M); long y = getNumberGroups();
        if ((x <= k) && (k <= y))
            {res = M; H = M - 1;}
        else
            L = M + 1;
    }
    printf("%ld\n", res);
}
