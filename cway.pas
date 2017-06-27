//uses crt;
const
        maxn=1000;
        maxscs=10000;
type
        bignum=record
        va:array[1..maxscs] of byte;
        sl:integer;
        end;
var
n:integer;
count:bignum;
//a:array[0..maxn] of qword;
{procedure change(var a,b:bignum);
        var
                tmp:bignum;
        begin
        tmp:=a;
        a:=b;
        b:=tmp;
        end;}
function nhan(a,b:bignum{;la,lb:integer;var le:integer}) :bignum;
        var
                i,j,k:integer;
                tmp:bignum;
        begin
        fillchar(tmp,sizeof(tmp),0);
        //if a[0]<b[0] then change(a,b);
        for i:=maxscs downto maxscs-a.sl+1 do
        for j:= maxscs downto maxscs-b.sl+1 do
                begin
                k:=-maxscs+i+j;
                tmp.va[k]:=tmp.va[k]+a.va[i]*b.va[j];
                if maxscs-k+1>tmp.sl then tmp.sl:=maxscs-k+1;
                if tmp.va[k]>9 then
                        begin
                        tmp.va[k-1]:=tmp.va[k-1]+tmp.va[k] div 10;
                        tmp.va[k]:=tmp.va[k] mod 10;
                        end;
                end;
        if tmp.va[maxscs-tmp.sl]<>0 then inc(tmp.sl);
        nhan:=tmp;
        end;
function plus(a,b:bignum{;la,lb:integer;var le:integer}) :bignum;
        var
                tmp:bignum;
                i:integer;
        begin
        fillchar(tmp,sizeof(tmp),0);
        if a.sl>b.sl then tmp.sl:=a.sl else tmp.sl:=b.sl;
        for i:= maxscs downto maxscs-tmp.sl+1 do
                begin
                //if a[i]+b[i]=0 then break;
                tmp.va[i]:=tmp.va[i]+a.va[i]+b.va[i];
                if tmp.va[i]>9 then
                        begin
                        if i=maxscs-tmp.sl+1 then inc(tmp.sl);
                        tmp.va[i-1]:=tmp.va[i] div 10;
                        tmp.va[i]:=tmp.va[i] mod 10;
                        end;
                end;
        plus:=tmp;
        end;
function lengths(i:integer):byte;
        var
                tmp:byte;
        begin
        tmp:=trunc(ln(i)/ln(10))+1;
        lengths:=tmp;
        end;
function numtoara(i:integer{;var le:byte}):bignum;
        var
                tmp:bignum;
                j:integer;
        begin
        fillchar(tmp,sizeof(tmp),0);
        tmp.sl:=lengths(i);
        for j:=maxscs downto maxscs-tmp.sl+1 do
                begin
                tmp.va[j]:=i mod 10;
                i:=i div 10;
                end;
        numtoara:=tmp;
        end;
function tich(l,r:integer):bignum;//tinh tich tu l toi r
        var
                tmp:bignum;
                i:integer;
        begin
        fillchar(tmp,sizeof(tmp),0);
        tmp.va[maxscs]:=1;
        tmp.sl:=1;
        for i:= l to r do tmp:=nhan(tmp,numtoara(i));
        tich:=tmp;
        end;
procedure ghikq;
        var
                i,j:integer;
        begin
        //count:=nhan(numtoara(a),numtoara(b));
        //count:=tich(a,b);
        for j:= maxscs-count.sl+1 to maxscs do
                write(count.va[j]);
        end;
procedure xuli;
        var
                k:integer;
        begin
        n:=n-2;
        count:=plus(numtoara(1),numtoara(n));
        for k:= 2 to n do
                count:=plus(count,tich(n-k+1,n));
        end;
begin
readln(n);
if n>2 then
        begin
        xuli;
        ghikq;
        end
else write('1');
end.
