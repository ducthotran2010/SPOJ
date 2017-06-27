#include <stdio.h>
#include <vector>
#include <cstring>
#include <set>
#define MAXN 1010

using namespace std;

vector<pair<long, long> > A[MAXN];
long n, m;

namespace Prim {
    set<pair<long, long> > Queue;
    bool d[MAXN], found[MAXN];
    long Value[MAXN];

    void init() {
        memset(d, false, sizeof(d));
        memset(Value, 0, sizeof(Value));
        memset(found, false, sizeof(found));
    }

    long getV(long s) {
        long res = 0;
        d[s] = true;
        for (vector<pair<long, long> >::const_iterator i = A[s].begin(); i != A[s].end(); ++i)
            Queue.insert(make_pair(i->first, i->second));

        do {
            while (!Queue.empty() && d[Queue.begin()->second])
                Queue.erase(Queue.begin());
            if (Queue.empty()) return res;

            set<pair<long, long> >::const_iterator i0 = Queue.begin();
            d[i0->second] = true;
            res = max(res, i0->first);

            for (vector<pair<long, long> >::const_iterator i = A[i0->second].begin(); i != A[i0->second].end(); ++i)
                if (!d[i->second])
                    Queue.insert(make_pair(i->first, i->second));
        } while (true);

    }
}

int main()
{
    Prim::init();
    scanf("%ld %ld", &n, &m);
    while (m--) {
        long x, y, v;
        scanf("%ld %ld %ld", &x, &y, &v);
        A[x].push_back(make_pair(v, y));
        A[y].push_back(make_pair(v, x));
    }
    printf("%ld", Prim::getV(1));
    return 0;
}
