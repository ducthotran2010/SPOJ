const
        inp='NKSPILJA.inp';
        maxn=5000;
type
        point=record
        x,y:real;end;
        line=record
        a,b:point;end;
        lline=record
        a,b,c:real;end;
var
n:integer;
min,gh:real;
a:array[1..maxn] of point;
d:array[1..maxn-1] of line;

procedure nhap;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        gh:=100000;
        for i:= 1 to n do
                begin
                readln(f,a[i].x,a[i].y);
                if a[i].y<gh then gh:=a[i].y;
                end;
        close(f);
        end;
procedure init;
        var
                i:integer;
        begin
        for i:= 1 to n-1 do
                begin
                d[i].a:=a[i];
                d[i].b:=a[i+1];
                end;
        end;
function cll(p1,p2:point):lline;//tao duong thang tu 2 diem
        var
                tmp:lline;
        begin
        tmp.a:=p1.y-p2.y;
        tmp.b:=p2.x-p1.x;
        tmp.c=p1.x*p2.y - p2.x*p1.y;
        cll:=tmp;
        end;
function gd(d1,d2:lline):point;//gd duong thang
        var
                tmp:point;
        begin
        tmp.y:=(d1.c*d2.a/d1.a-d2.c)/(d2.b-d2.a*d1.b/d1.a);
        tmp.x:=(-d1.b*tmp.y-d1.c)/d1.a;
        gd:=tmp;
        end;
function seen(p:point):boolean;
        var
                tmp:boolean;
        begin
        if p.y<gh then exit(false);
        if p.x<a[1].x or p.x>a[n].x then exit(false);
        for i:= 1 to n do


        seen:=tmp;
        end;
procedure xuli;
        var
                tmp:point;
        begin
        min:=100000;
        for i:= 1 to n-2 do
        for j:= i+1 to n-1 do
                begin
                tmp:=gd(cll(d[i].a,d[i].b),cll(d[j].a,d[j].b));
                if seen(tmp) then
                if tmp.y<min then min:=tmp.y;
                end;
        writeln(min:0:2);
        end;
