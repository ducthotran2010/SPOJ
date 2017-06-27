#include <stdio.h>
#include <algorithm>
#include <vector>
using namespace std;

vector<long long> Arr;

int main()
{
    long long n, k, v;
    scanf("%lld %lld", &n, &k);
    while (n--) {
        scanf("%lld", &v);
        Arr.push_back(v);
    }
    sort(Arr.begin() + 1, Arr.end());

    long long result = *Arr.begin();
    long long id = Arr.size() - 1;
    while (k--) result += Arr[id--];
    while (id) result -= Arr[id--];
    printf("%lld", result);
    return 0;
}
