const
        INP = 'BASE.inp';
        SOE: String = '0123456789';
var
        c: Char;
        Found: Boolean;
        n, k, m, res: Int64;
        t, i, tmpV, Vs: Longint;
        s, tmps: AnsiString;
procedure try(i: Longint);
        var
                j: Longint;
        begin
        for j := 1 to k do
        if not Found then
                begin
                tmpS[i] := SOE[j];
                tmpV := ord(SOE[j]) - 48 + tmpV;

                if tmpV <= Vs then
                if tmps > s then
                if i < m then
                        try(i + 1)
                else
                        begin
                        if tmpV = Vs then
                        if tmps > s then
                                begin
                                s := tmps;
                                Found := true;
                                exit;
                                end;
                        end;

                tmpS[i] := 'a';
                tmpV := tmpV - (ord(SOE[j]) - 48);
                end;
        end;
procedure process;
        var
                i, j: Longint;
        begin
        //--------N(10) to N(k)----------
        s := '';
        while n <> 0 do
                begin
                s := chr(ord(n mod k) + 48) + s;
                n := n div k;
                end;
        //write(s, #32);
        //--------Initialization----------
        Vs := 0;
        tmpS := '';
        tmpV := 0;
        m := length(s);
        Found := false;
        for i := 1 to m do
                begin
                tmpS := tmpS + 'a';
                Vs := ord(s[i]) - 48 + Vs;
                end;
        //------------Finding-------------
        try(1);
        //------------N1(k) to N1(10)-----
        j := m;
        n := 1;
        res := 0;
        while j <> 0 do
                begin
                res := res + (ord(s[j]) - 48) * n;
                n := n * k;
                j := j - 1;
                end;
        writeln(res);
        end;
begin
        assign(input, INP);
        reset(input);
        readln(t);
        for i := 1 to t do
                begin
                readln(n, k);
                process;
                end;
        close(input);
end.

