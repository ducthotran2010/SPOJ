const
        inp = 'ONGBANGAU.inp';
        out = 'ONGBANGAU.out';
        maxn = 100;
var
        intCPST, intCPTS, n, m, s, t, i0, res: longint;
        a: array [1..maxn,1..maxn] of longint;
        v: array [1..maxn,1..2] of longint;
        d: array[1..maxn] of longint;
procedure input;
        var
                f: text;
                i, x, y, v: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m, s, t);
        for i:= 1 to m do
                begin
                read(f, x, y, v);
                a[x,y] := v;
                a[y,x] := v;
                end;
        close(f);
        end;
//------------------------------------------
procedure Dijkstra(s, t, mode: longint);
procedure init;
        var
                i: longint;
        begin
        for i:= 1 to n do
                begin
                d[i] := 0;
                v[i,mode] := maxlongint;
                end;
        d[s] := 1;
        v[s,mode] := 0;
        for i:= 1 to n do
        if a[s,i] <> 0 then
                v[i,mode] := a[s,i];
        end;
procedure proChooseTop;
        var
                i, min, intL: longint;
        begin
        intL := 0;
        min := maxlongint;
        for i:= 1 to n do
        if d[i] = 0 then
        if v[i,mode] < min then
                begin
                min := v[i,mode];
                intL := i;
                end;
        if intL = 0 then
                i0 := 0;
        i0 := intL;
        d[intL] := 1;
        end;
procedure proEditLabel;
        var
                i: longint;
        begin
        for i:= 1 to n do
        if d[i] = 0 then
        if v[i,mode] > v[i0,mode] + a[i,i0] then
                v[i,mode] := v[i0,mode] + a[i,i0];
        end;

        begin
        init;
        i0 := s;
        repeat
                proChooseTop;
                if i0 = 0 then
                        break;
                proEditLabel;
        until d[t] <> 0;
        end;
//------------------------------------------
procedure prinf;
        var
                f: text;
        begin
        assign(f, out);
        rewrite(f);
        if res >= maxlongint then
                writeln(f,'CRY')
        else
                writeln(f, res);
        close(f);
        end;
//------------------------------------------
procedure process;
        var
                i: longint;
        function min(a, b: longint): longint;
                begin if a < b then min := a else min := b; end;
        begin
        res := maxlongint;
        for i := 1 to n do
        if i <> s then
        if i <> t then
        if v[i,1] = v[i,2] then
        if res > v[i,1] + v[i,2] then
                res := v[i,1] + v[i,2];
        end;
begin
        input;
        Dijkstra(s,t,1);
        Dijkstra(t,s,2);
        process;
        prinf;
end.
