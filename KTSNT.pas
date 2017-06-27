var
        n: longint;
function ktnt(n: longint): boolean;
        var
                i: longint;
        begin
        for i := 2 to trunc(sqrt(n)) do
        if n mod i = 0 then
                exit(false);
        exit(true);
        end;
begin
        n := 10000;
        while not ktnt(n) do
                n := n + 1;
        writeln(n);
end.
