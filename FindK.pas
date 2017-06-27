Var
  n,m,min:longint;
  a:array[1..1000000] of longint;
Procedure Solving1(x:longint);
var
  i:longint;
Begin
i:=2;
  Repeat
    If x mod i<>0 then
      inc(i)
    Else
      Begin
      inc(a[i]);
      x:=x div i;
    End;
  Until x=1;
End;
Procedure Enter;
Var
  f:text;
  i:longint;
Begin
  Assign(f,'TimK.inp');
  Reset(f);
  Readln(f,n,m);
  Fillchar(a,sizeof(a),0);
  For i:=2 to n do
    Solving1(i);
  Close(f);
End;
Procedure Solving2;
Var
  i,L1,p:longint;
  L:array[1..1000000] of longint;
begin
Fillchar(L,sizeof(L),0);
i:=2;
p:=0;
  Repeat
    If m mod i<>0 then
      inc(i)
    Else
     Begin
      inc(L[i]);
      L1:=i;
      m:=m div i;
     End;
  Until m=1;
i:=0;
min:=100000000;
For i:=1 to L1 do
  If (L[i]<>0) and ((a[i] div L[i])<min) then
    min:=a[i] div L[i];
End;
Procedure OutF;
var
  f:text;
Begin
  Assign(f,'TIMK.OUT');
  Rewrite(f);
  Write(f,min);
  Close(f);
End;
begin
  Enter;
  Solving2;
  OutF;
End.
