const
        //inp='QBBISHOP.inp';
        maxn=200;
        oo=1;
type
        mang=record
        x,y,val:byte;end;
var
n,m:byte;
sta,fin:mang;
d,c:longint;
a:array[0..maxn+1,0..maxn+1] of shortint;
procedure nhap;
        var
        //        f:text;
                u,v,i:byte;
        begin
        //assign(f,inp);
        //reset(f);
        readln({f,}n,m,sta.x,sta.y,fin.x,fin.y);
        fillchar(a,sizeof(a),0);
        for i:= 1 to m do
                begin
                read({f,}u,v);
                a[u,v]:=-oo;
                end;
        //close(f);
        end;
procedure init;
        var
                i:byte;
        begin
        for i:= 0 to n+1 do
                begin
                a[0,i]:=-oo;
                a[n+1,i]:=-oo;
                a[i,0]:=-oo;
                a[i,n+1]:=-oo;
                end;
        end;
procedure xuli;
        var
        i,j:byte;
        u:mang;
        queue:array[1..maxn*maxn+1] of mang;
        procedure turn(x,y:shortint;u:mang);
                begin
                if a[u.x+x,u.y+y]<>-oo then
                        begin
                        if a[u.x+x,u.y+y]=0 then
                                begin
                                inc(c);
                                queue[c]:=u;
                                inc(queue[c].x,x);
                                inc(queue[c].y,y);
                                queue[c].val:=u.val+1;
                                a[u.x+x,u.y+y]:=u.val+1;
                                end;
                        inc(u.x,x);
                        inc(u.y,y);
                        turn(x,y,u);
                        end;

                end;
        begin
        d:=0;
        c:=1;
        sta.val:=0;
        queue[1]:=sta;
        a[sta.x,sta.y]:=-oo;
        repeat
                inc(d);
                u:=queue[d];
                        turn(-1,-1,u);
                        turn(-1,1,u);
                        turn(1,-1,u);
                        turn(1,1,u);
        until (d>=c)or(a[fin.x,fin.y]<>0);
        if a[fin.x,fin.y]<>0 then writeln(a[fin.x,fin.y]) else writeln(-1);
        end;
begin
        nhap;
        if (sta.x+sta.y+fin.x+fin.y) mod 2=0 then
        begin
        init;
        xuli;
        end
        else writeln(-1);
end.
