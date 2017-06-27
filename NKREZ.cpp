#include <stdio.h>
#include <vector>
#include <algorithm>
#define MAXV 30010
using namespace std;

long maxUseTime[MAXV], IT[MAXV * 4];

vector<pair<long, long> > mVector;

struct node {
    long ll, rr, id;
    node(long L, long R, long K)
        { ll = L; rr = R; id = K; }
    node left()
        { return node(ll, (ll + rr)/2, id * 2); }
    node right()
        { return node((ll + rr)/2 + 1, rr, id * 2 + 1); }

    void update(long nID, long nValue) {
        if (nID < ll || rr < nID) return;
        if (ll == rr && rr == nID) {
            IT[id] = nValue;
            return;
        }
        left().update(nID, nValue);
        right().update(nID, nValue);
        IT[id] = max(IT[left().id], IT[right().id]);
    }

    long get_max_value(long L, long R) {
        if (R < ll || rr < L) return 0;
        if (L <= ll && rr <= R)
            return IT[id];
        return max(left().get_max_value(L, R), right().get_max_value(L, R));
    }
};

bool sort_by_second(pair<long, long> a, pair<long, long> b)
    { return a.second < b.second; }

int main()
{
    long n, result = 0, maxV = 0;
    scanf("%ld", &n);
    for (int i = 0; i < n; ++i) {
        long left, right;
        scanf("%ld %ld", &left, &right);
        mVector.push_back(make_pair(left, right));
        maxV = max(maxV, right);
    }
    sort(mVector.begin(), mVector.end(), sort_by_second);

    for(vector<pair<long, long> >::const_iterator i = mVector.begin(); i != mVector.end(); ++i) {
        maxUseTime[i->second] = max(maxUseTime[i->second], node(1, maxV, 1).get_max_value(0, i->first) + i->second - i->first);
        result = max(result, maxUseTime[i->second]);
        node(1, maxV, 1).update(i->second, maxUseTime[i->second]);
    }
//    printf("\n");
//    for(vector<pair<long, long> >::const_iterator i = mVector.begin(); i != mVector.end(); ++i)
//        printf("%ld %ld %ld\n", i->first, i->second, maxUseTime[i->second]);
//    printf("\n");
    printf("%ld", result);
    return 0;
}
