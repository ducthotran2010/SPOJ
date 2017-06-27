const
        INP = 'ATM.INP';
        OUT = 'ATM.OUT';
        MAXC = 15;
        L: array[1..4] of Int64 = (1, 2, 3, 5);
var
        W: Int64;
        t, i, c: Longint;
        Ft: array[0..10] of Int64 = (0, 1, 1, 1, 2, 1, 2, 2, 2, 3, 2);
        Fc: array[0..10] of Int64 = (1, 1, 1, 1, 2, 1, 2, 1, 1, 3, 1);
procedure process;
        var
                i, j: Longint;
                Broke: Boolean;
                k, st, sc: Int64;
        begin
        //------ INIT -------
        st := 0;
        sc := 1;
        W := W div 1000;
        if W > exp((c + 1) * ln(10)) then
                begin
                st := 1;
                Broke := False;
                k := trunc(exp(c * ln(10)));
                //CAI TIEN BANG TKNP
                while W >= 2 * L[4] * k * (st + 1) do st := st + 1;
                W := W - L[4] * k * st;
                end;
        //--------------------
        while W <> 0 do
                begin
                st := st + Ft[W mod 10];
                sc := sc * Fc[W mod 10];
                W := W div 10;
                end;
        writeln(st, #32, sc);
        end;
begin
        assign(output, OUT);
        rewrite(output);
        assign(input, INP);
        reset(input);
        readln(t);
        for i := 1 to t do
                begin
                readln(W, c);
                if W mod 1000 = 0 then
                        process
                else
                        writeln(0);
                end;
        close(input);
        close(output);
end.
