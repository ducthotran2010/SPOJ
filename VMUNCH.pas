const
        {inp='VMUNCH.INP';
        out='VMUNCH.OUT';}
        max=100;
type
        mang=record
        x,y:byte;end;
var
        a:array[0..max+1,0..max+1] of char;
        n,m:byte;
        step:array[1..max,1..max] of byte;
        sta,fin:mang;
procedure nhap;
        var
                i,j:byte;
                {f:text;}
        begin
        {assign(f,inp);
        reset(f);}
        readln({f,}n,m);
        for i:= 1 to n do
                begin
                for j:= 1 to m do
                        begin
                        read({f,}a[i,j]);
                        if a[i,j]='B' then
                                begin
                                fin.x:=i;
                                fin.y:=j;
                                a[i,j]:='.';
                                end
                        else
                        if a[i,j]='C' then
                                begin
                                sta.x:=i;
                                sta.y:=j;
                                end;
                        end;
                readln{(f)};
                end;
        {close(f);}
        end;
procedure xuli;
        var
                queue:array[1..max*max] of mang;
                d,c:integer;
                u:mang;
        begin
        d:=0;
        c:=1;
        queue[1]:=sta;
        step[fin.x,fin.y]:=0;
        step[sta.x,sta.y]:=0;
        repeat
                inc(d);
                u:=queue[d];
                if a[u.x-1,u.y]='.' then
                        begin
                        inc(c);
                        queue[c]:=u;
                        dec(queue[c].x);
                        a[queue[c].x,queue[c].y]:='*';
                        step[queue[c].x,queue[c].y]:=step[u.x,u.y]+1;
                        end;
                if a[u.x,u.y-1]='.' then
                        begin
                        inc(c);
                        queue[c]:=u;
                        dec(queue[c].y);
                        a[queue[c].x,queue[c].y]:='*';
                        step[queue[c].x,queue[c].y]:=step[u.x,u.y]+1;
                        end;
                if a[u.x,u.y+1]='.' then
                        begin
                        inc(c);
                        queue[c]:=u;
                        inc(queue[c].y);
                        a[queue[c].x,queue[c].y]:='*';
                        step[queue[c].x,queue[c].y]:=step[u.x,u.y]+1;
                        end;
                if a[u.x+1,u.y]='.' then
                        begin
                        inc(c);
                        queue[c]:=u;
                        inc(queue[c].x);
                        a[queue[c].x,queue[c].y]:='*';
                        step[queue[c].x,queue[c].y]:=step[u.x,u.y]+1;
                        end;
        until (d>=c)or(step[fin.x,fin.y]<>0);
        end;
procedure ghikq;
        begin
        write(step[fin.x,fin.y]);
        end;
begin
        nhap;
        xuli;
        ghikq;
end.