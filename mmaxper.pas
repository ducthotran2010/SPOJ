//THUAT TOAN SAI VOI TEST INP
const
        inp='';
        maxn=1000;
type
        mang=record
        l,r:integer;end;
var
n:integer;
a:array[0..maxn+1] of mang;
procedure input;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i].l,a[i].r);
        close(f);
        end;
procedure process;
        type
                mang1=record
                n,d:longint;end;
        var
                i:integer;
                f:array[1..maxn] of mang1;
        function max(a,b:longint):longint;
                begin
                if a>b then max:=a else max:=b;
                end;
        begin
        f[1].n:=a[1].r;
        f[1].d:=a[1].l;
        for i:= 2 to n do
                begin
                f[i].n:=max(f[i-1].d+a[i].r+abs(a[i-1].r-a[i].l),f[i-1].n+a[i].r+abs(a[i-1].l-a[i].l));
                f[i].d:=max(f[i-1].d+a[i].l+abs(a[i-1].r-a[i].r),f[i-1].n+a[i].l+abs(a[i].r-a[i-1].l));
                end;
        writeln(max(f[n].n,f[n].d));
        end;
begin
        input;
        process;
end.
