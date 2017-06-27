const
        INP = 'PALI2.INP';
        MAXN = 2000;
var
        i, k, m, n: Longint;
        s: AnsiString;
        b: array[1..MAXN] of AnsiString;
function check(L, R: Longint): Boolean;
        var
                i: Longint;
        begin
        for i := L to (L + R) shr 1 do
        if s[i] <> s[(L + R) - i] then
                exit(false);
        exit(true);
        end;
begin
        assign(input, INP);
        reset(input);
        readln(n);
        readln(s);
        close(input);
        k := 1;
        m := 0;
        repeat
                for i := n downto k do
                if check(k, i) then
                        begin
                        m := m + 1;
                        b[m] := copy(s, k, i - k + 1);
                        k := i + 1;
                        break;
                        end;
        until k > n;
        writeln(m);
        for i := 1 to m do
                writeln(b[i]);
end.
