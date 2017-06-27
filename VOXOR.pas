const
        INP = '';
        OUT = '';
        MAXN = trunc(1e5);
        MAXP = 32;
        Num: array['0'..'1'] of Longint = (0, 1);
type
        String2 = String[32];
        Node = ^Indexed;
        Indexed = record
                d: array[0..1] of Longint;
                Link: array[0..1] of Node;
                end;
var
        T: Node;
        s: String2;
        i, n, k, x, e: Longint;
        a: array[1..MAXN] of Longint;
        swap: array[1..MAXP] of Longint;
function toBIN(x: Longint): String2;
        begin
        toBIN := '';
        while x <> 0 do
                begin
                toBIN := chr(x mod 2 + 48) + toBIN;
                x := x shr 1;
                end;
        while MAXP > length(String2(toBIN)) do
                toBIN := '0' + toBIN;
        end;
procedure init;
        var
                P: Node;
                i, j: Longint;
                s: String2;
        begin
        new(T);
        T^.d[0] := 0;
        T^.d[1] := 0;
        for i := 1 to n do
                begin
                s := toBIN(a[i]);
                P := T;
                for j := 1 to MAXP do
                        begin
                        if P^.d[Num[s[j]]] = 0 then
                                begin
                                new(P^.Link[Num[s[j]]]);
                                P^.Link[Num[s[j]]]^.d[0] := 0;
                                P^.Link[Num[s[j]]]^.d[1] := 0;
                                end;
                        P^.d[Num[s[j]]] := P^.d[Num[s[j]]] + 1;
                        P := P^.link[Num[s[j]]];
                        end;
                end;
        end;
procedure update(x: Longint);
        var
                P, tmp2, tmp3: Node;
                tmp, i: Longint;
                s: String2;
        begin
        new(P);
        P := T;
        s := toBIN(x);
        for i := 1 to MAXP do
        if s[i] = '1' then
                swap[i] := swap[i] xor 1;
        end;
function find(x: Longint): Longint;
        var
                P: Node;
                i: Longint;
        begin
        new(P);
        P := T;
        s := '';
        for i := 1 to MAXP do
        if P^.d[0 xor swap[i]] < x then
                begin
                x := x - P^.d[0 xor swap[i]];
                P := P^.Link[1 xor swap[i]];
                s := s + '1'//chr((1 xor swap[i]) + 48);
                end
        else
                begin
                P := P^.Link[0 xor swap[i]];
                s := s + '0'//chr((0 xor swap[i]) + 48);
                end;
        find := 0;
        for i := 1 to MAXP do
        if s[i] = '0' then
                find := find shl 1
        else
                find := find shl 1 or 1;

        end;
begin
        assign(input, INP);
        reset(input);
        readln(n, k);
        for i := 1 to n do read(a[i]); readln;
        init;
        for i := 1 to k do
                begin
                readln(s);
                if s[1] = 'F' then
                        begin
                        delete(s, 1, 5);
                        val(s, x, e);
                        writeln(find(n - x + 1))
                        end
                else
                        begin
                        delete(s, 1, 4);
                        val(s, x, e);
                        update(x);
                        end;
                end;
        close(input);
end.
