const
        inp='SmallestPaths.inp';
        out='SmallestPaths.out';
        maxdinh=200;
var
        kt:boolean;
        n,m,s,e,i0:integer;
        a:array[1..maxdinh,1..maxdinh] of integer;
        d:array[1..maxdinh] of byte;
        t,v:array[1..maxdinh] of integer;
procedure nhap;
        var
                f:text;
                i,x,y,c:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,m,s,e);
        for i:= 1 to m do
                begin
                read(f,x,y,c);
                a[x,y]:=c;
                a[y,x]:=c;
                end;
        close(f);
        end;
procedure init;
        var
                i:integer;
        begin
        for i:= 1 to n do d[i]:=0;
        d[s]:=1;
        i0:=s;
        t[s]:=0;
        for i:= 1 to n do v[i]:=maxint;
        for i:= 1 to n do
                if a[i,i0]<>0 then
                begin
                v[i]:=a[i,i0];
                t[i]:=i0;
                end;
        end;
procedure chondinh;
        var
                min,cs,i:integer;
        begin
        min:=maxint;
        cs:=0;
        for i:= 1 to n do
        if d[i]=0 then
        if v[i]<min then
                begin
                cs:=i;
                min:=v[i];
                end;
        if cs<>0 then
                begin
                d[cs]:=1;
                i0:=cs;
                end
        else    kt:=false;
        end;
procedure suanhan;
        var
                i:integer;
        begin
        for i:= 1 to n do
        if d[i]=0 then
        if a[i,i0]<>0 then
        if v[i]>v[i0]+a[i,i0] then
                begin
                v[i]:=v[i0]+a[i,i0];
                t[i]:=i0;
                end;
        end;
procedure dijkstra;
        begin
        init;
        kt:=true;
        repeat
                chondinh;
                if not kt then break;
                suanhan;
        until d[e]>0;
        end;
procedure ghikq;
        var
                f:text;
                i:integer;
        begin
        assign(f,out);
        rewrite(f);
        if kt then
        begin
        writeln(f,v[e]);
        i:=e;
        repeat
                write(f,i,'<-');
                i:=t[i];
        until t[i]=0;
        write(f,s);
        end
        else
        write(f,'These has no paths from ',s,' to ',e);
        close(f);
        end;
procedure hoanvi(var s,e:integer);
        var
                tam:integer;
        begin
        tam:=s;
        s:=e;
        e:=tam;
        end;
begin
        nhap;
        //hoanvi(s,e);
        dijkstra;
        ghikq;
end.
