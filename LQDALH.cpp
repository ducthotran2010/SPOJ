#include <stdio.h>
#include <math.h>
#define EPS 1e-15

using namespace std;

struct point {double x, y;};
struct line {double a, b, c;};

double R;
point O = {0, 0};
double sqr(const double n) {return n*n;};
double distance(const point A, const point B) {return sqrt(sqr(A.x - B.x) + sqr(A.y - B.y));}

void makeline(line &d, const point A, const point B)
{
    d.a = A.y - B.y;
    d.b = B.x - A.x;
    d.c = -(d.a*A.x + d.b*A.y);
}
void giaodiem(point &H, const line d, const point AA)
{
    point A, B;
    if (d.b != 0)
        {
            double b = 2 * d.a/d.b * d.c/d.b;
            double a = 1 + d.a/d.b * d.a/d.b;
            double Delta = 4 * (sqr(d.a) * sqr(R) - sqr(d.c))/sqr(d.b) + 4 * sqr(R);
            A.x = (-b - sqrt(Delta))/2/a;
            B.x = (-b + sqrt(Delta))/2/a;
            A.y = (-d.c - d.a*A.x)/d.b;
            B.y = (-d.c - d.a*B.x)/d.b;
        }
    else
        {
            double b = 2 * d.b/d.a * d.c/d.a;
            double a = 1 + d.b/d.a * d.b/d.a;
            double Delta = 4 * (sqr(d.b) * sqr(R) - sqr(d.c))/sqr(d.a) + 4 * sqr(R);
            A.y = (-b - sqrt(Delta))/2/a;
            B.y = (-b + sqrt(Delta))/2/a;
            A.x = (-d.c - d.b*A.y)/d.a;
            B.x = (-d.c - d.b*B.y)/d.a;
        }
    if (distance(A, AA) < distance(B, AA)) H = A; else H = B;
}
void rotatePoint(point &H, const point B, const double angle)
{
    H.x = B.x * cos(angle) - B.y * sin(angle);
    H.y = B.x * sin(angle) + B.y * cos(angle);
}
double getAngle(const point vectorA, const point vectorB)
{
	double dot = vectorA.x * vectorB.x + vectorA.y * vectorB.y;
	double det = vectorA.x * vectorB.y - vectorA.y * vectorB.x;
	double angle = atan2(det, dot);
	return fabs(angle);
}
void makevector(point &vectorAB, const point A, const point B)
{
    vectorAB.x = B.x - A.x;
    vectorAB.y = B.y - A.y;
}
double scalar(const point vectorA, const point vectorB)
    {return vectorA.x * vectorB.x + vectorA.y * vectorB.y;}
double length(const point vectorA) {return sqrt(sqr(vectorA.x) + sqr(vectorA.y));}
double calculateAngle(const point vectorA, const point vectorB)
{
    //printf("%.17lf\n", distance(vectorA, vectorB));
    if (fabs(distance(vectorA, vectorB) - 2*R) < EPS) return M_PI;
    if (distance(vectorA, vectorB) < EPS) return 0;
    double cosA = scalar(vectorA, vectorB)/length(vectorA)/length(vectorB);
    cosA = acos(cosA);
    return cosA;
}
/*double getAngle(const point vectorA, const point vectorB)
{
    point vectorP;
    double k = scalar(vectorA, vectorB)/sqr(length(vectorB));
    vectorP.x = k * vectorB.x; vectorP.y = k * vectorB.y;
    double Angle = length(vectorP)/length(vectorA);
    Angle = acos(Angle);
    if (k < 0) Angle = M_PI - Angle;
    return Angle;
}*/
void solve(point &I, point A0, point B0, const point A, const point B)
{
    point H;
    bool chieuduong = true;
    if (-B0.y * A0.x + B0.x * A0.y < 0) chieuduong = false;
    long runtimes = 0;
    while (true)
    {
        double midAngle = getAngle(A0, B0)/2;
        rotatePoint(H, B0, (chieuduong) ? midAngle : -midAngle);

        point vectorHA, vectorHB;
        makevector(vectorHA, H, A);
        makevector(vectorHB, H, B);

        double i = getAngle(vectorHA, H);
        double r = getAngle(vectorHB, H);
        I = H;
        if (i < r) A0 = H; else B0 = H;
        if (fabs(midAngle) < EPS) break;
        if (++runtimes > 1000) break;
        //printf("%.15lf ___ %.15lf %.15lf\n", midAngle, H.x, H.y);
     }
}

int main()
{
    int t;
    line dOA, dOB;
    point A0, B0, A, B, RES;
    scanf("%d", &t);
    for (int i = 1; i <= t; i++)
    {
        scanf("%lf %lf %lf %lf %lf", &R, &A.x, &A.y, &B.x, &B.y);
        makeline(dOA, O, A);
        makeline(dOB, O, B);
        giaodiem(A0, dOA, A); //printf("%.10lf %.10lf\n", A0.x, A0.y);
        giaodiem(B0, dOB, B); //printf("%.10lf %.10lf\n", B0.x, B0.y);
        solve(RES, A0, B0, A, B);
        printf("%.4lf %.4lf\n", RES.x, RES.y);
    }
    //printf("%.17lf\n", cos(0.000000020));
    //printf("%.17lf\n", acos(1.0000000000000000));
    return 0;
}
