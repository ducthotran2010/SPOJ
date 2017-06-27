const
        inp = '';
        out = '';
        maxN = 3;
var
        x: array[1..maxN] of longint;

function max(a, b: longint): longint; inline;
        begin if a > b then max := a else max := b; end;

procedure sort;
        var
                i, j, tmp: longint;
        begin
        for i := 1 to maxN do
        for j := i + 1 to maxN do
        if x[i] > x[j] then
                begin
                tmp := x[i];
                x[i] := x[j];
                x[j] := tmp;
                end;
        end;
begin
        assign(input, inp);
        reset(input);
        while not seekeof do
                begin
                readln(x[1], x[2], x[3]);
                sort;
                writeln(max(x[2] - x[1], x[3] - x[2]) - 1);
                end;
        close(input);
end.