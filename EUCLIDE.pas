//Start code: 1:33pm 26/10/2014
//First run: 2:14pm 26/10/2014
const
        inp='EUCLIDE.inp';
        out='EUCLIDE.out';
        inf=747474747;
        maxd=5;
        maxn=6666;
        maxv=1000000000;
type
        specialarrays=record
        d:array[1..maxd] of longint;
        end;
var
        fo:text;
        n,d0:integer;
        res:int64;
        a:array[1..maxn] of specialarrays;
procedure process;
        var
                max,value:longint;
                i,lo:integer;
                distance:array[1..maxn] of longint;
                d:array[1..maxn] of boolean;
procedure choose;
        var
                i:integer;
        begin
        max:=0;
        for i:= 1 to n do
        if not d[i] then
        if max<distance[i] then
                begin
                max:=distance[i];
                lo:=i;
                end;
        res:=((res mod inf)*(max mod inf))mod inf;
        d[lo]:=true;
        end;
procedure editlabel;
        var
                i:integer;
        function from(i,j:integer):longint;
                var
                        k:byte;
                        tmp:longint;
                begin
                tmp:=0;
                for k:= 1 to d0 do
                        tmp:=(tmp+((a[i].d[k]-a[j].d[k])mod inf)*((a[i].d[k]-a[j].d[k])mod inf))mod inf;
                value:=tmp;
                exit(tmp);
                end;
        begin
        for i:= 1 to n do
        if not d[i] then
        if distance[i]<from(lo,i) then
                distance[i]:=value;
        end;
procedure init;
        var
                i,j:integer;
        begin
        d[1]:=true;
        for i:= 2 to n do
                begin
                distance[i]:=0;
                d[i]:=false;
                end;
        distance[1]:=maxv;
        for i:= 2 to n do
        for j:= 1 to d0 do
                distance[i]:=(distance[i]mod inf+((a[i].d[j]-a[1].d[j]) mod inf)*((a[i].d[j]-a[1].d[j])mod inf)mod inf)mod inf;
        end;
        begin
        init;
        for i:= 1 to n-1 do
                begin
                choose;
                editlabel;
                end;
        end;
operator =(a,b:specialarrays)c:boolean;
        var
                j:integer;
        begin
        for j:= 1 to d0 do
        if a.d[j]<>b.d[j] then
                exit(false);
        exit(true);
        end;
procedure IP;
        var
                f:text;
                t,z,i,j:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,t);
        for z:= 1 to t do
                begin
                res:=1;
                readln(f,n,d0);
                i:=0;
                repeat
                        inc(i);
                        for j:= 1 to d0 do read(f,a[i].d[j]);
                        for j:= 1 to i-1 do
                        if a[i]=a[j] then
                                begin
                                dec(i);
                                dec(n);
                                break;
                                end;
                until i=n;
                process;
                writeln(fo,res mod inf);
                end;
        close(f);
        end;
procedure IPO;
        begin
        assign(fo,out);
        rewrite(fo);
        IP;
        close(fo);
        end;
begin
        IPO;
end.
