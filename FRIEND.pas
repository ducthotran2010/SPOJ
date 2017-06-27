const
        inp = 'FRIEND.inp';
        out = 'FRIEND.out';
        maxn = 100;
var
        YES: boolean;
        n, m, Ha, Sa, Hb, Sb, intMinT, intCrossT: longint;
        a: array[1..maxn,1..maxn] of longint;
        d: array[1..maxn,1..5] of boolean;
        t, v: array[1..maxn,1..5] of longint;
procedure input;
        var
                f: text;
                i, x, y, v: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m);
        readln(f, Ha, Sa, Hb, Sb);
        for i := 1 to m do
                begin
                read(f, x, y, v);
                a[x,y] := v;
                a[y,x] := v;
                end;
        close(f);
        end;
//----------------------DIJKSTRA----------------------
procedure Dijkstra(s, mode: longint);
        var
                i, intL, intMinV: longint;
        procedure init;
                var
                        i: longint;
                begin
                for i := 1 to n do
                        begin
                        v[i,mode] := maxlongint;
                        d[i,mode] := false;
                        t[i,mode] := s;
                        end;
                v[s,mode] := 0;
                d[s,mode] := true;
                t[s,mode] := -1;
                for i := 1 to n do
                if a[s,i] > 0 then
                        v[i,mode] := a[s,i];
                end;
        begin
        init;
        repeat
                // Find min
                intL := 0;
                intMinV := maxlongint;
                for i:= 1 to n do
                if not d[i,mode] then
                if intMinV > v[i,mode] then
                        begin
                        intMinV := v[i,mode];
                        intL := i;
                        end;
                if intL = 0 then
                        break;

                // Edit label
                d[intL,mode] := true;
                for i:= 1 to n do
                if not d[i,mode] then
                if a[intL,i] <> 0 then
                if v[i,mode] > v[intL,mode] + a[intL,i] then
                        begin
                        v[i,mode] := v[intL,mode] + a[intL,i];
                        t[i,mode] := intL;
                        end;
        until false;
        end;
//------------------------PROCESS-----------------------------------
procedure process;
        var
                i: longint;
        begin
        for i := 1 to n do
                d[i,5] := false;
        d[Ha,5] := true;
        d[Sa,5] := true;
        d[Hb,5] := true;
        d[Sb,5] := true;

        YES := false;
        intMinT := maxlongint;
        intCrossT := 0;

        for i := 1 to n do
        if not d[i,5] then
        if v[i,1] + v[i,2] = v[Sa,1] then
        if v[i,3] + v[i,4] = v[Sb,3] then
        if v[i,1] = v[i,3] then
        if intMinT > v[i,1] then
                begin
                YES := true;
                intMinT := v[i,1];
                intCrossT := i;
                end;
        end;
//------------------------PRINF-------------------------------------------
procedure prinf;
        var
                f: text;
                e: longint;
        begin
        assign(f, out);
        rewrite(f);
        if YES then
                begin
                Dijkstra(intCrossT, 5);
                writeln(f, 'YES');
                writeln(f, v[Sa,1]);
                //-------------------
                e := Ha;
                repeat
                        write(f, e, ' ');
                        e := t[e,5];
                until e = intCrossT;
                e := intCrossT;
                repeat
                        write(f, e, ' ');
                        e := t[e,2];
                until e = -1;
                //-------------------
                writeln(f);
                writeln(f, v[Sb,3]);
                //-------------------
                e := Hb;
                repeat
                        write(f, e, ' ');
                        e := t[e,5];
                until e = intCrossT;
                e := intCrossT;
                repeat
                        write(f, e, ' ');
                        e := t[e,4];
                until e = -1;
                //-------------------
                writeln(f);
                writeln(f, intCrossT);
                writeln(f, intMinT);
                end
        else
                writeln(f, 'NO');
        close(f);
        end;
begin
        input;
        Dijkstra(Ha, 1);
        Dijkstra(Sa, 2);
        Dijkstra(Hb, 3);
        Dijkstra(Sb, 4);
        process;
        prinf;
end.