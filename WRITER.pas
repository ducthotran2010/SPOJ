var
        s: ansistring;
        t, i, n, j, res: longint;
        CCount, CClass: array[#0..#255] of longint;
procedure init;
        var
                i: char;
        begin
        CClass['.'] := 1;
        CCount['.'] := 1;
        CClass[','] := 1;
        CCount[','] := 2;
        CClass['?'] := 1;
        CCount['?'] := 3;
        CClass['!'] := 1;
        CCount['!'] := 4;
        CClass['_'] := 0;
        CCount['_'] := 1;
        for i := '0' to '9' do
                CClass[i] := ord(i) - 48;
        CCount['1'] := 5;
        CCount['2'] := 4;
        CCount['3'] := 4;
        CCount['4'] := 4;
        CCount['5'] := 4;
        CCount['6'] := 4;
        CCount['7'] := 5;
        CCount['8'] := 4;
        CCount['9'] := 5;
        CCount['0'] := 2;
        end;
procedure addc(x, y: char; cclasst: longint);
        var
                i: char;
                count: longint;
        begin
        count := 0;
        for i := x to y do
                begin
                count := count + 1;
                CCount[i] := count;
                CClass[i] := cclasst;
                end;
        end;
begin
        init;
        addc('a', 'c', 2);
        addc('d', 'f', 3);
        addc('g', 'i', 4);
        addc('j', 'l', 5);
        addc('m', 'o', 6);
        addc('p', 's', 7);
        addc('t', 'v', 8);
        addc('w', 'z', 9);
        readln(t);
        for i := 1 to t do
                begin
                readln(s);
                res := length(s);
                s := '.' + s;
                for j := 2 to length(s) do
                        begin
                        res := res + CCount[s[j]];
                        if CClass[s[j]] = CClass[s[j - 1]] then
                                res := res - 1;
                        end;
                writeln(res);
                end;
end.