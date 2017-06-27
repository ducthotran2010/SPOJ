const
        inp='BFS.inp';
        out='BFS.out';
        max=100;
var
        a: array[1..max, 1..max] of Boolean;
        Trace: array[1..max] of Integer;
        n, s, t: Integer;
        queue: array[1..max] of integer;
procedure nhap;
        var
                f:text;
                x,y:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,s,t);
        fillchar(a,sizeof(a),0);
        while not seekeof(f) do
                begin
                read(f,x,y);
                a[x,y]:=true;
                a[y,x]:=true;
                end;
        close(f);
        end;
procedure BFS;
        var

                front,rear,u,v: integer;
        begin
        front:= 1;
        rear:= 1;
        queue[1]:= s;
        fillChar(Trace,sizeof(trace), 0);
        trace[s]:= -1;
        repeat
                u:= Queue[Front];
                Inc(Front);
                for v := 1 to n do
                if a[u, v] and (Trace[v] = 0)then
                        begin
                        Inc(Rear);
                        Queue[Rear] := v;
                        Trace[v] := u;
                        end;
        until Front > Rear;
        end;
procedure Result;
        var
                fo: Text;
                v: Integer;
        begin
        Assign(fo,out);
        Rewrite(fo);
        Writeln(fo, 'From ', s, ' you can visit: ');
        for v := 1 to n do
        if Trace[v] <> 0 then
                Write(fo, v, ', ');
        WriteLn(fo);
        WriteLn(fo, 'The path from ', s, ' to ', t, ': ');
        if Trace[t] = 0 then
                WriteLn(fo,'not found')
        else
                begin
                while t <> s do
                        begin
                        Write(fo, t, '<-');
                        t := Trace[t];
                        end;
                WriteLn(fo, s);
                end;
        Close(fo);
        end;
begin
        nhap;
        BFS;
        Result;
end.
