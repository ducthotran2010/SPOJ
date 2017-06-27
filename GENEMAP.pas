//Start time: 6:27pm 22/10/2014
//First run: 6:58 22/10/2014
//Edited: 7:27pm 22/10/2014
const
        inp='GENEMAP.inp';
        out='GENEMAP.out';
        maxn=100000;
        inf=1000000007;
type
        index=record
        f,t:longint;
        end;
        stringtype=ansistring;
var
        k:integer;
        res:int64;
        m,n:longint;
        a:array[1..maxn] of index;
        s:array[1..maxn] of stringtype;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,k);
        for i:= 1 to n do
                readln(f,s[i]);
        close(f);
        end;
procedure init;
        var
                i:longint;
        function tht(s:stringtype):stringtype;
                var
                        tmp:stringtype;
                        n:word;
                        i:longint;
                begin
                tmp:='';
                n:=length(s);
                for i:= 1 to n do tmp:=tmp+s[i]+s[n-i+1];
                exit(tmp);
                end;
        function dx(s:stringtype):stringtype;
                var
                        tmp:char;
                        n:word;
                        i:longint;
                begin
                n:=length(s);
                for i:= 1 to n div 2 do
                        begin
                        tmp:=s[i];
                        s[i]:=s[n-i+1];
                        s[n-i+1]:=tmp;
                        end;
                exit(s);
                end;
        begin
        for i:= 1 to n do
                begin
                s[i]:=tht(s[i]);
                s[i]:=s[i]+dx(s[i]);
                end;
        end;
procedure sort(l,r:longint);
        var
                tmp,x:stringtype;
                i,j:longint;
        begin
        i:=l;
        j:=r;
        x:=s[(l+r) div 2];
        repeat
                while s[i]<x do inc(i);
                while s[j]>x do dec(j);
                if i<=j then
                        begin
                        tmp:=s[i];
                        s[i]:=s[j];
                        s[j]:=tmp;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
        end;
procedure partition;
        var
                i:longint;
                j:integer;
        begin
        m:=1;
        k:=k*2;
        a[1].f:=1;//f = from
        a[1].t:=1;//t = to
        for i:= 2 to n do
        for j:= 1 to k do
        if s[i][j]<>s[i-1][j] then
                begin
                a[m].t:=i-1;
                inc(m);
                a[m].f:=i;
                a[m].t:=n;
                break;
                end;
        end;
procedure process;
        var
                tmp:int64;
                z,i:longint;
        begin
        res:=0;
        for z:= 1 to m do
                begin
                tmp:=a[z].t-a[z].f+1;
                res:=res mod inf+((tmp*tmp-tmp)div 2) mod inf;
                tmp:=1;
                for i:= a[z].f+1 to a[z].t do
                if (s[i-1][k+1]=s[i][k+1]) or (s[i-1][k+2]=s[i][k+2]) then
                        inc(tmp)
                else
                        begin
                        if res<((tmp*tmp-tmp)div 2)mod inf then res:=res+inf;
                        res:=res-((tmp*tmp-tmp)div 2)mod inf;
                        tmp:=0;
                        end;
                if res<((tmp*tmp-tmp)div 2)mod inf then res:=res+inf;
                        res:=res-((tmp*tmp-tmp)div 2)mod inf;
                end;
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,res);
        close(f);
        end;
begin
        input;
        init;
        sort(1,n);
        partition;
        process;
        prinf;
end.