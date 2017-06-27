Const
        MaxN = 10;
Var
        f: array[0..MaxN,0..16] of Longint;
        i, n, t: Longint;

Function Max(a, b: Longint):Longint;
        Begin If a > b then exit(a) else exit(b) End;

Procedure Init;
        Var
                i, k: Longint;
        Begin
        f[0,0] := 0;
        f[1,0] := 1;
        For i := 2 to MaxN do
        If Odd(i) then
                f[i,0] := f[i div 2,0] + f[i div 2 + 1,0]
        else
                f[i,0] := f[i div 2,0];
        For k := 1 to 16 do
        For i := 1 to MaxN - 1 shl k + 1 do
                f[i,k] := Max(f[i,k - 1],f[i + 1 shl (k - 1),k - 1]);
        End;
Procedure Prinf;
        Var
                i, k: Longint;
        Begin
        For k := 1 to 16 do
                Begin
                For i := 1 to MaxN - 1 shl k + 1 do
                        Write(f[i,k], ' ');
                Writeln;
                end;
        End;
BEGIN
        Init;
        Prinf;
END.
Function GetMax(i,j:Longint):Longint;
Var k:Longint;
Begin
  If j=0 then Exit(0);
  k:=trunc(ln(j-i+1)/ln(2));
  Exit(max(f[i,k],f[j - 1 shl k + 1,k]));
End;