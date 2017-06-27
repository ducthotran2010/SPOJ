uses crt;
type
        Tarray=array[1..3] of word;
var
        k:Tarray;
        n,m:integer;
procedure nhap;
        begin
        k[1]:=1;
        k[2]:=4;
        k[3]:=1;
        n:=3;
        m:=4;
        end;
procedure DPP;
        var
                c: array[0..4] of Integer;
                x: TArray;
                i,v: Integer;
        begin
        for V := 0 to M do c[V] := 0;
        for i := 1 to n do c[k[i]] := c[k[i]] + 1;
        for V := 1 to M do c[V] := c[V-1] + c[V];
        for i := n downto 1 do
                begin
                V := k[i];
                x[c[V]] := k[i];
                {c[V] := c[V] - 1;}
                end;
        k := x;
        for v:= 1 to n do write(k[v],' ');
        end;
begin
        nhap;
        DPP;

end.
