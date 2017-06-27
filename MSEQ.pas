const
        maxn=100000;
        maxm=1000000000;
        inp='MSEQ.inp';
        out='MSEQ.out';
var
kq,n,m:longint;
d:array[0..maxm] of longword;
b:array[0..maxn] of longint;
procedure input;
        var
                f:text;
                i:longint;
                oo,j:int64;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        oo:=(1000000000 div m)*m;
        for i:= 1 to n do begin
                read(f,j);
                j:=(j+oo) mod m;
                if d[j]=0 then begin
                        inc(b[0]);
                        b[b[0]]:=j;
                end;
                inc(d[j]);
        end;
        close(f);
        end;
function max(a,b:longint):longint;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure process;
        var
                i:longint;
        begin
        kq:=0;
        if d[0]>0 then begin
                kq:=1;
                d[0]:=0;
        end;
        for i:= 1 to b[0] do begin
                kq:=kq+max(d[b[i]],d[m-b[i]]);
                d[b[i]]:=0;
                d[m-b[i]]:=0;
        end;
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,kq);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
