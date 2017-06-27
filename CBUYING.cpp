#include <stdio.h>
#include <algorithm>
#include <vector>
#include <utility>
using namespace std;

vector<pair<long long, long long> > Arr;

int main()
{
    long long N, B, result = 0;
    scanf("%lld %lld", &N, &B);
    while (N--) {
        long long Pi, Ci;
        scanf("%lld %lld", &Pi, &Ci);
        Arr.push_back(make_pair(Pi, Ci));
    }
    sort(Arr.begin(), Arr.end());
    for (vector<pair<long long, long long> >::const_iterator id = Arr.begin(); id != Arr.end(); ++id) {
        long long numTake = min(B/id->first, id->second);
        result += numTake;
        B -= numTake * id->first;
    }
    printf("%lld", result);
    return 0;
}
