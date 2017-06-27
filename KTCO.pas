//Start time: 4:07pm 24/10/2014
//First run: 4:36pm 24/10/2014
// Edited: 5:24pm 24/10/2014
const
        inp='KTCO.inp';
        out='KTCO.out';
        maxn=10000;
type
        index=record
        h,w:longint;
        end;
var
        f:text;
        n:integer;
        res:int64;
        a:array[1..maxn] of index;
procedure sortgu(l,r:integer);
        var
                tmp:index;
                x:longint;
                i,j:integer;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2].h;
        repeat
                while a[i].h<x do inc(i);
                while a[j].h>x do dec(j);
                if i<=j then
                        begin
                        tmp:=a[i];
                        a[i]:=a[j];
                        a[j]:=tmp;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if l<j then sortgu(l,j);
        if i<r then sortgu(i,r);
        end;

procedure sortld(l,r:integer);
        var
                tmp:index;
                x:longint;
                i,j:integer;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2].w;
        repeat
                while a[i].w>x do inc(i);
                while a[j].w<x do dec(j);
                if i<=j then
                        begin
                        tmp:=a[i];
                        a[i]:=a[j];
                        a[j]:=tmp;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if l<j then sortld(l,j);
        if i<r then sortld(i,r);
        end;

procedure init;
        var
                i,j:integer;
        begin
        sortgu(1,n);
        j:=1;
        for i:= 2 to n do
        if a[i-1].h<>a[i].h then
                begin
                sortld(j,i-1);
                j:=i;
                end;
        end;
procedure process;
        var
                j,i:integer;
        begin
        j:=1;
        res:=0;
        for i:= 1 to n do
        if a[i].h>=j then
                begin
                inc(j);
                res:=res+a[i].w;
                end;
        writeln(f,res);
        end;
procedure IP;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        repeat
                readln(f,n);
                if n=0 then break;
                for i:= 1 to n do readln(f,a[i].h,a[i].w);
                init;
                process;
        until false;
        close(f);
        end;
procedure IPU;
        begin
        assign(f,out);
        rewrite(f);
        IP;
        close(f);
        end;
begin
        IPU;
end.
