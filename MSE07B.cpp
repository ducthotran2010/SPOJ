#include <cstdio>
#include <set>
#include <utility>
using namespace std;

typedef pair<long, long> ii;
typedef set<ii>::const_iterator ii_itr;

set<ii> queue_k, queue_p;

int main() {
    long n;
    while (scanf("%ld", &n), n != 0) {
        if (n == 1) {
            long k, p;
            scanf("%ld %ld", &k, &p);
            queue_p.insert(make_pair(p, k));
            queue_k.insert(make_pair(k, p));
        } else if (queue_k.size() == 0)
            printf("0\n");
        else {
            long id = (n == 3) ? queue_p.begin()->second : queue_p.rbegin()->second;
            printf("%ld\n", id);
            ii_itr itr = queue_k.lower_bound(make_pair(id, 0));
            while (itr->first == id) {
                queue_p.erase(make_pair(itr->second, itr->first));
                queue_k.erase(itr++);
        }}
    }
    return 0;
}
