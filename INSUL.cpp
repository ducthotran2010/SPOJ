#include <stdio.h>
#include <algorithm>
#include <vector>

using namespace std;

vector<long> A;

int main()
{
    long res = 0, n, v;
    scanf("%ld", &n);
    while (n--) {
        scanf("%ld", &v);
        A.push_back(v);
        res += v;
    }
    sort(A.begin(), A.end());
    long i = 0, j = A.size() - 1;
    while (i <= j) {
        if (i != j) res += A[j] - A[i];
        ++i; --j;
    }

    printf("%ld", res);
    return 0;
}
