const
        inp = 'CRATE.inp';
        out = 'CRATE.out';
var
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        intMaxV := -maxlongint;
        for i := 1 to n do
                begin
                read(f, Fx[i], Fy[i]);
                A[Fx[i]] := A[Fx[i]] + 1;
                B[Fy[i]] := B[Fy[i]] + 1;
                intMaxV := max(intMaxV, max(Fx[i], Fy[i]));
                end;
        close(f);
        end;
procedure process;
        var
                i: longint;
        begin
        for i := 1 to intMaxV do
                C[i] := min(A[i], B[i]);
        for i := intMaxV - 1 downto 1 do
                begin
                A[i] := A[i] + A[i + 1];
                B[i] := B[i] + B[i + 1];
                C[i] := C[i] + C[i + 1];
                end;
        end;
procedure prinf;
        var
                f: text;
                i: longint;
        begin
        assign(f, out);
        rewrite(f);
        for i := 1 to n do
                begin
                writeln(f, n - (A[Fx[i]] + B[Fy[i]] - C[
        end;