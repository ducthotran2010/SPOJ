#include <stdio.h>
#include <vector>
#include <math.h>
#define MAXN 10010
#define EPS 1e-9
using namespace std;

bool Went[MAXN];
long n, K;
double firstDistance, secondDistance, S, Vmin, Vmax, V0;

namespace LinkedList {
    vector<long> pre, nex;
    void init(long n) {
        for (long i = 0; i <= n; ++i) pre.push_back(i - 1);
        for (long i = 0; i <= n; ++i) nex.push_back(i + 1);
        pre[1] = n;
        nex[n] = 1;
    }
    void deleteElement(long p) {
        nex[pre[p]] = nex[p];
        pre[nex[p]] = pre[p];
    }
}

namespace process {
    double result;
    long startNum = 1;
    bool just_print_out = true;
    vector<long> Pos;
    vector<double> Len, Acc, Ans, tmpAns;

    double distance(long s, long t) {
        return (s < t) ? (t - s) * firstDistance : (n + t - s) * firstDistance;
    }

    void init() {
        while (Went[startNum]) ++startNum;
        long p = startNum;
        do {
            Pos.push_back(p);
            Ans.push_back(V0);
            Len.push_back(distance(p, LinkedList::nex[p]));
            tmpAns.push_back(0); Acc.push_back(0);
            if (fabs(Len.back() - secondDistance) > EPS) just_print_out = false;
            p = LinkedList::nex[p];
        } while (p != startNum);
    }

    bool check(double time) {
        double minval = Vmin;
        tmpAns[0] = Vmin;
        for (unsigned long i = 0; i < Len.size(); ++i)
            Acc[i] = (secondDistance - Len[i])/time;
        for (unsigned long i = 1; i < Len.size(); ++i) {
            tmpAns[i] = tmpAns[i - 1] + Acc[i - 1];
            minval = min(minval, tmpAns[i]);
        }
        for (unsigned long i = 0; i < Len.size(); ++i) {
            tmpAns[i] = tmpAns[i] - minval + Vmin;
            if (tmpAns[i] < Vmin || tmpAns[i] > Vmax) return false;
        }
        return true;
    }

    void solve() {
        if (just_print_out) return;

        double lo = EPS;
        double hi = 10000;
        while (hi - lo > EPS) {
            double tmp = (lo + hi)/2;
            if (check(tmp)) {
                result = tmp;
                Ans = tmpAns;
                hi = tmp;
            } else lo = tmp;
            //break;
        }
        //printf("%.6lf", Vmin);
    }
}

int main()
{
    scanf("%ld %ld %lf %lf %lf %lf", &n, &K, &S, &Vmin, &Vmax, &V0);

    LinkedList::init(n);
    firstDistance = S/n;
    secondDistance = S/(n - K);
    while (K--) {
        long num;
        scanf("%ld", &num);
        Went[num] = true;
        LinkedList::deleteElement(num);
    }

    process::init();
    process::solve();

    printf("%.6lf\n", process::result);
    for (unsigned long i = 0; i < process::Len.size(); ++i)
        printf("%ld %.6lf\n", process::Pos[i], process::Ans[i]);
    return 0;
}
