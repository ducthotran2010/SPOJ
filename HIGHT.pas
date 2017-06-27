const
        inp = 'HIGHT.inp';
        out = 'HIGHT.out';
        maxn = 100;
var
        n, s, t: longint;
        a: array[1..maxn,1..maxn] of longint;
        d: array[1..maxn] of boolean;
        tr, v: array[1..maxn] of longint;

function min(a, b: longint): longint;
        begin if a < b then min := a else min := b; end;

procedure input;
        var
                f: text;
                x, y, v: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, t, s);
        while not eof(f) do
                begin
                readln(f, x, y, v);
                a[x,y] := v;
                a[y,x] := v;
                end;
        close(f);
        end;
procedure Dijkstra;
        var
                i, intL, intMaxV: longint;
        procedure init;
                var
                        i: longint;
                begin
                for i := 1 to n do
                        begin
                        v[i] := 0;
                        d[i] := false;
                        tr[i] := s;
                        end;
                v[s] := 0;
                d[s] := true;
                tr[s] := -1;
                for i := 1 to n do
                if a[s,i] > 0 then
                        v[i] := a[s,i];
                end;
        begin
        init;
        repeat
                intL := 0;
                intMaxV := 0;
                for i := 1 to n do
                if not d[i] then
                if v[i] > 0 then
                if intMaxV < v[i] then
                        begin
                        intMaxV := v[i];
                        intL := i;
                        end;
                if intL = 0 then
                        break;
                d[intL] := true;
                for i := 1 to n do
                if not d[i] then
                if a[i,intL] > 0 then
                if v[i] < min(v[intL], a[intL,i]) then
                        begin
                        v[i] := min(v[intL], a[intL,i]);
                        tr[i] := intL;
                        end;
        until d[t];
        end;
procedure prinf;
        var
                f: text;
                e: longint;
        begin
        assign(f, out);
        rewrite(f);
        if v[t] > 0 then
                begin
                writeln(f, v[t]);
                e := t;
                repeat
                        write(f, e, ' ');
                        e := tr[e];
                until e = -1;
                end
        else
                writeln(f, 0);
        close(f);

        end;
begin
        input;
        Dijkstra;
        prinf;
end.
