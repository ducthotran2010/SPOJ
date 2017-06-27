const
        inp = 'MRG.inp';
        out = '';
        maxN = 500;
        maxM = 1000 * 10;
        Finding = 1 shl 1;
        Found3 = 1 shl 2;
        Found123 = 1 shl 3;
var
        n, m, Found: longint;
        Count: array[1..3] of longint;
        a, Link: array[-maxM..maxM] of longint;
        w: array[1..maxM] of longint;
        Last: array[1..maxN] of longint;
        InTree: array[1..maxN,1..3] of longint;
        Used: array[1..maxM] of boolean;
procedure enter;
        var
                i, x, y, k: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m);
        for i := 1 to m do
                begin
                readln(x, y, k);
                a[i] := x;
                Link[i] := Last[x];
                Last[x] := i;
                a[-i] := y;
                Link[-i] := Last[y];
                Last[y] := -i;
                w[i] := k;
                end;
        close(input);
        end;
procedure visit(s: longint);
        var
                k: longint;
        begin
        k := Last[s];
        while k <> 0 do
                begin
                if not Used[abs(k)] then
                if w[abs(k)] = 3 then
                if InTree[a[-k],1] <> InTree[s,1] then
                        begin
                        InTree[a[-k],1] := InTree[s,1];
                        InTree[a[-k],2] := InTree[s,2];
                        Count[3] := Count[3] + 1;
                        Used[abs(k)] := true;
                        visit(a[-k]);
                        end;
                k := Link[k];
                end;
        end;
procedure process;
        var
        begin
        Found := false;
        for i := 1 to n do
                begin
                InTree[i,1] := i;
                InTree[i,2] := i;
                end;
        for i := 1 to n do
                visit(i);
        Count[1] := Count[3];
        Count[2] := Count[3];
        if Count[3] = n - 1 then
                begin
                Found := true;
                exit;
                end;
        //--------T1--------
        for i := 1 to n do
                visit(i, 1);
        end;
begin
end.