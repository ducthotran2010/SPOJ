const
        //inp='JOBSET.inp';
        maxn=500;//ha gioi han de an test
        //maxm=10000;
type
        bin=record
        d:qword;
        va:longint;end;
var
c,max:qword;
n,m:integer;
a:array[1..maxn] of bin;
x,k:array[1..maxn] of byte;
procedure nhap;
        var
                f:text;
                i,u,v:integer;
        begin
        //assign(f,inp);
        //reset(f);
        readln({f,}n);
        for i:= 1 to n do
                begin
                read({f,}a[i].va);
                a[i].d:= 1 shl (n-i);
                if a[i].va>0 then k[i]:=1;
                end;
        readln({f,}m);
        for i:= 1 to m do
                begin
                read({f,}u,v);
                a[u].d:=a[u].d or (1 shl (n-v));
                end;
        //close(f);
        end;
procedure tinh;
        var
                i:integer;
                t{,c}:int64;
        function laybit(x:qword;y:integer):byte;
                begin
                laybit:= (x shr y) and 1;
                end;
        begin
        t:=0;
        //c:=0;
        //for i:= 1 to n do
        //if x[i]=1 then c:=c or a[i].d;
        for i:= 1 to n do
        if laybit(c,n-i)=1 then
                t:=t+a[i].va;
        if t>max then max:=t;
        end;
procedure try(i:integer);
        var
                j:byte;
                bef:qword;
        begin
        for j:= k[i] downto 0 do
                begin
                x[i]:=j;
                bef:=c;
                c:=c or a[i].d*j;
                if i=n then
                        tinh
                else
                        try(i+1);
                c:={c xor a[i].d*j;//}bef;
                end;
        end;
begin
        nhap;
        c:=0;
        max:=0;
        try(1);
        writeln(max);
end.
