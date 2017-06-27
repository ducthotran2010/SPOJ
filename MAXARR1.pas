const
        inp = 'MAXARR1.inp';
        out = 'MAXARR1.out';
        maxn=1000000;
var
        t,i,n,l:longint;
        a:array[1..maxn+1] of int64;
        f:array[1..maxn+1] of int64;
function ktnt(n: longint): boolean;
        var
                i: longint;
        begin
        for i := 2 to trunc(sqrt(n)) do
        if n mod i = 0 then
                exit(false);
        exit(true);
        end;
function max(a,b:int64):longint;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure init;
        var
                i:longint;
        begin
        a[1]:=1;
        f[1]:=1;
        for i:= 2 to maxn+1 do
        if i mod 2 = 0 then
                begin
                a[i]:=a[i div 2];
                f[i]:=max(a[i],f[i-1]);
                end
        else
                begin
                a[i]:=a[i div 2]+a[i div 2+1];
                f[i]:=max(a[i],f[i-1]);
                end;
        for i := 1 to 50 do
        if ktnt(i) then
        if i and 1 = 1 then
                writeln(i, '. ', a[i]);
        end;
begin
        init;
        assign(input, inp);
        reset(input);
        assign(output, out);
        rewrite(output);
        readln(t);
        for i:= 1 to t do
                begin
                readln(n);
                writeln(f[n]);
                end;
        close(output);
        close(input);
end.
