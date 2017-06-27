#include <cstdio>
#include <iostream>
#include <stack>
#include <cstring>
#include <string>
#include <utility>
using namespace std;

stack<pair<long long, long long> > mStack;

int main()
{
    string Str;
    mStack.push(make_pair(-1, 1));
    while (cin>>Str, Str != "ENDPROGRAM") {
        fflush(stdin);
        if (Str == "IF")
            #define S_IF 0
            mStack.push(make_pair(S_IF, 1));
        else if (Str == "ELSE")
            #define S_ELSE 1
            mStack.push(make_pair(S_ELSE, 1));
        else if (Str == "END_IF") {
            long tmp = 0, IF_END = 1;
            while (mStack.top().first != S_IF) {
                tmp += mStack.top().second;
                if (mStack.top().first == S_ELSE)
                    IF_END = 0;
                mStack.pop();
            }
            tmp += mStack.top().second + IF_END; mStack.pop();
            mStack.top().second *= tmp;
        }
    }
    printf("%lld", mStack.top().second);
    return 0;
}
