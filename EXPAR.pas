const
        INP = '';
        OUT = '';
        SOE: String = '02468..13579..';
        OPERATORS = ['+', '-', '*'];
var
        res: Longint;
        strInf, strFor: AnsiString;
procedure enter;
        var
                strKind1, strKind2: AnsiString;
        begin
        assign(input, INP);
        reset(input);
        readln(strInf);
        readln(strKind1);
        readln(strKind2);
        if strKind1 = 'Even' then
                SOE[6] := 'x'
        else
                SOE[13] := 'x';
        if strKind2 = 'Even' then
                SOE[7] := 'y'
        else
                SOE[14] := 'y';
        close(input);
        end;
procedure formatString;
        var
                i: Longint;
        begin
        strInf := strInf + '+';
        strFor := '';
        for i := 1 to length(strInf) do
        if strInf[i] in OPERATORS then
                strFor := strFor + strInf[i - 1] + strInf[i];
        end;
procedure process;
        var
                p, v, rp: longint;
        begin
        p := 2;
        res := 0;
        while p <= length(strFor) do
                begin
                if strFor[p] = '*' then
                        begin
                        rp := pos(strFor[p - 1], SOE) div 8;
                        p := p + 2;
                        while strFor[p] = '*' do
                                begin
                                v := pos(strFor[p - 1], SOE) div 8;
                                rp := rp and v;
                                p := p + 2;
                                end;
                        v := pos(strFor[p - 1], SOE) div 8;
                        rp := rp and v;
                        res := res xor rp;
                        end
                else
                        begin
                        v := pos(strFor[p - 1], SOE) div 8;
                        res := res xor v;
                        end;
                p := p + 2;
                end;
        if res = 0 then
                writeln('Even')
        else
                writeln('Odd');
        end;
begin
        enter;
        formatString;
        process;
end.