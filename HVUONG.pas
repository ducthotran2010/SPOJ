const
        maxn=2000;
        inp='HVUONG.inp';
        out='HVUONG.out';
var
n,l,r:integer;
x,y,z,t:array[1..maxn] of integer;
procedure input;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do readln(f,x[i],y[i],z[i],t[i]);
        close(f);
        end;
procedure process;
        type
                line=record
                a,b,c:real;end;
                point=record
                x,y:real;end;
        var
                i,j:integer;
                tmp,tmpm,maxt,mint:real;

        function kc(a,b:point):real;
                var
                        tmp:real;
                begin
                tmp:=(a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y);
                kc:=sqrt(tmp);
                end;
        function min(a,b:real):real;
                begin
                if a<b then min:=a else min:=b;
                end;
        function max(a,b:real):real;
                begin
                if a>b then max:=a else max:=b;
                end;
        function distance(a,b:integer):real;
                var
                        tmp:real;
                        d1,d2,d3:line;
                        tmpa1,tmpa2,tmpb1,tmpb2:point;
                function extract(x,y,z,t:real):line;
                        var
                                tmp:line;
                        begin
                        tmp.a:=y-t;
                        tmp.b:=x-z;
                        tmp.c:=t*z-y*x;
                        extract:=tmp;
                        end;
                function gd(d1,d2:line):point;
                        begin
                        gd.x:=(d1.b*d2.c-d2.b*d1.c)/(d1.a*d2.b-d2.a*d1.b);
                        gd.y:=(d1.a*d2.c-d2.a*d1.c)/(d1.a*d2.b-d2.a*d1.b);
                        end;
                begin
                tmpa1.x:=max(x[a],z[a]);
                tmpa1.y:=max(y[a],t[a]);
                tmpa2.x:=min(x[a],z[a]);
                tmpa2.y:=min(y[a],t[a]);
                tmpb1.x:=max(x[b],z[b]);
                tmpb1.y:=max(y[b],t[b]);
                tmpb2.x:=min(x[b],z[b]);
                tmpb2.y:=min(y[b],t[b]);
                d1:=extract(tmpa1.x,tmpa1.y,tmpa2.x,tmpa2.y);
                d2:=extract(tmpb1.x,tmpb1.y,tmpb2.x,tmpb2.y);
                d3:=extract(tmpa1.x,tmpa2.y,tmpa2.x,tmpa1.y);
                tmp:=kc(gd(d1,d3),gd(d2,d3));
                distance:=tmp;
                end;
        function findmint:real;
                var
                        tmp:real;
                        tmpa1,tmpa2,tmpb2,tmpb1:point;
                begin
                tmpa1.x:=x[i];
                tmpa1.y:=y[i];
                tmpa2.x:=z[i];
                tmpa2.y:=t[i];
                tmpb1.x:=x[j];
                tmpb1.y:=y[j];
                tmpb2.x:=z[j];
                tmpb2.y:=t[j];
                tmp:=min(min(kc(tmpa1,tmpb1),kc(tmpa1,tmpb2)),min(kc(tmpa2,tmpb1),kc(tmpa2,tmpb2)));
                findmint:=tmp;
                end;
        begin
        maxt:=-1;
        l:=1;
        r:=1;
        for i:= 1 to n-1 do
        for j:= i+1 to n do
                begin
                tmp:=distance(i,j);
                if tmp=maxt then
                        begin
                        tmpm:=findmint;
                        if mint>tmpm then
                                begin
                                mint:=tmpm;
                                l:=i;
                                r:=j;
                                end;
                        end else
                if tmp>maxt then
                        begin
                        mint:=findmint;
                        maxt:=tmp;
                        l:=i;
                        r:=j;
                        end;
                end;
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        write(f,l,' ',r);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
