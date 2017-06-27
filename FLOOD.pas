const
        inp='FLOOD.INP';
        out='FLOOD.OUT';
type
        mang=record
        l,r:byte;
        end;
var
        n,m:byte;
        a,b:array[0..51,0..51] of char;
        finish,start:mang;
        f:array[1..2500] of mang;
        countflood:integer;
        traceflood,traces,step:array[0..51,0..51] of integer;
procedure nhap;
        var
                fi:text;
                i,j:byte;
        begin
        assign(fi,inp);
        reset(fi);
        readln(fi,n,m);
        countflood:=0;
        //fillchar(a,sizeof(a),#);
        for i:= 1 to m do
                begin
                for j:= 1 to n do
                        begin
                        traceflood[i,j]:=2500;
                        read(fi,a[i,j]);
                        if a[i,j]='*' then
                                begin
                                inc(countflood);
                                f[countflood].l:=i;
                                f[countflood].r:=j;
                                end
                        else
                        if a[i,j]='S' then
                                begin
                                start.l:=i;
                                start.r:=j;
                                a[i,j]:='.';
                                end
                        else
                        if a[i,j]='D' then
                                begin
                                finish.l:=i;
                                finish.r:=j;
                                a[i,j]:='.';
                                end;
                        end;
                readln(fi);
                end;
        close(fi);
        b:=a;
        end;
procedure BFSFlood(i:integer);
        var
                queue:array[1..2500] of mang;
                u:mang;
                d,c:integer;
        begin
        d:=0;
        c:=1;
        queue[1]:=f[i];
        traceflood[queue[1].l,queue[1].r]:=0;
        repeat
                inc(d);
                u:=queue[d];
                if a[u.l,u.r+1]='.' then
                        begin
                        a[u.l,u.r+1]:=#0;
                        inc(c);
                        queue[c]:=u;
                        //inc(queue[c].l);
                        inc(queue[c].r);
                        //traceflood[queue[i,c].l,queue[i.c].r]:=trace[u.l,u.r]+1;
                        if (traceflood[queue[c].l,queue[c].r]=0)
                        or (traceflood[queue[c].l,queue[c].r]>traceflood[u.l,u.r]+1) then
                        traceflood[queue[c].l,queue[c].r]:=traceflood[u.l,u.r]+1;
                        end
                else
                if a[u.l,u.r-1]='.' then
                        //begin
                        begin
                        a[u.l,u.r-1]:=#0;
                        inc(c);
                        queue[c]:=u;
                        //inc(queue[i,c].l);
                        dec(queue[c].r);
                        if (traceflood[queue[c].l,queue[c].r]=0)
                        or (traceflood[queue[c].l,queue[c].r]>traceflood[u.l,u.r]+1) then
                        traceflood[queue[c].l,queue[c].r]:=traceflood[u.l,u.r]+1;
                        end//end;
                else
                if a[u.l+1,u.r]='.' then
                        begin
                        inc(c);
                        queue[c]:=u;
                        inc(queue[c].l);
                        if (traceflood[queue[c].l,queue[c].r]=0)
                        or (traceflood[queue[c].l,queue[c].r]>traceflood[u.l,u.r]+1) then
                        traceflood[queue[c].l,queue[c].r]:=traceflood[u.l,u.r]+1;
                        //traceflood[queue[i,c].l,queue[i.c].r]:=trace[u.l,u.r]+1;
                        a[u.l+1,u.r]:=#0;
                        end
                else
                if a[u.l-1,u.r]='.' then
                        begin
                        inc(c);
                        queue[c]:=u;
                        dec(queue[c].l);
                        //dec(queue[c].r);
                        if (traceflood[queue[c].l,queue[c].r]=0)
                        or (traceflood[queue[c].l,queue[c].r]>traceflood[u.l,u.r]+1) then
                        traceflood[queue[c].l,queue[c].r]:=traceflood[u.l,u.r]+1;
                        a[u.l-1,u.r]:=#0;
                        end;
        until d>=c;
        end;
procedure init;
        var
                queue:array[1..2500] of mang;
                i,d,c:integer;
                u:mang;
                //mode:array[1..4] of boolean;
        begin
        fillchar(step,sizeof(step),0);
        fillchar(traceS,sizeof(traceS),0);
        //fillchar(mode,sizeof(mode),false);
        //Traceflood is stepflood
        for i:= 1 to countflood do
                begin
                BFSFlood(i);
                a:=b;
                end;
        d:=0;
        c:=1;
        queue[1]:=start;
        step[queue[1].l,queue[1].r]:=0;
        a[start.l,start.r]:=#0;
        repeat
                inc(d);
                u:=queue[d];
                //if mode[1] then
                if a[u.l,u.r-1]='.' then
                if step[u.l,u.r]+1<traceflood[u.l,u.r-1] then
                        begin
                        inc(c);
                        queue[c]:=u;
                        //inc(queue[c].l);
                        //inc(queue[c].r);
                        dec(queue[c].r);
                        step[queue[c].l,queue[c].r]:=step[u.l,u.r]+1;
                        a[u.l,u.r-1]:=#0;
                        end;
                //if mode[2] then
                if a[u.l,u.r+1]='.' then
                if step[u.l,u.r]+1<traceflood[u.l,u.r+1] then
                        begin
                        inc(c);
                        queue[c]:=u;
                        //inc(queue[c].l);
                        inc(queue[c].r);
                        step[queue[c].l,queue[c].r]:=step[u.l,u.r]+1;
                        a[u.l,u.r+1]:=#0;
                        end;
                //if mode[3] then
                if a[u.l+1,u.r]='.' then
                if step[u.l,u.r]+1<traceflood[u.l+1,u.r] then
                        begin
                        inc(c);
                        queue[c]:=u;
                        //inc(queue[c].l);
                        inc(queue[c].l);
                        step[queue[c].l,queue[c].r]:=step[u.l,u.r]+1;
                        a[u.l+1,u.r]:=#0;
                        end;
                if a[u.l-1,u.r]='.' then
                if step[u.l,u.r]+1<traceflood[u.l-1,u.r] then
                        begin
                        inc(c);
                        queue[c]:=u;
                        //dec(queue[c].l);
                        //dec(queue[c].r);
                        dec(queue[c].l);
                        step[queue[c].l,queue[c].r]:=step[u.l,u.r]+1;
                        a[u.l-1,u.r]:=#0;
                        end;
        until (d>=c)or(step[finish.l,finish.r]<>0);
        end;
procedure ghikq;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        if step[finish.l,finish.r]<>0 then
                write(f,step[finish.l,finish.r])
        else
                write(f,'KHONG');
        close(f);
        end;
begin
        nhap;
        init;
        ghikq;
end.
