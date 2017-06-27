Const
        fi='Four.inp';
        fo='Four.out';
Var
        a:array[1..2000] of int64;
        dem,n:int64;
Procedure Enter;
Var
        f:text;
        i:longint;
Begin
        //Randomize;
        Assign(f,fi);
        Reset(f);
        Readln(f,n);
        For i:=1 to n do
                Read(f,a[i]);
                //A[I]:=random(1000000)-random(1000000);
        Close(f);
End;
Procedure QS(L,H:longint);
Var
        i,j,x,t:longint;
begin
        i:=L;
        j:=H;
        x:=a[(l+h) div 2];
        Repeat
                While a[i]<x do inc(i);
                While a[j]>x do dec(j);
                If i<=j then
                Begin
                        t:=a[i];
                        a[i]:=a[j];
                        a[j]:=t;
                        Inc(i);
                        dec(j);
                End;
        Until i>j;
        If L<j then QS(l,j);
        If i<H then QS(i,H);
End;
procedure Bi_S(x,y:longint);
Var
        i,j:longint;
begin
        i:=y+1;
        j:=n;
        Repeat
        {If i=k then inc(i);
        If j=y then dec(j);}
        If -a[i]-a[j]=x then
                Begin
                inc(dem);
                Exit;
                End
        Else
        If -a[i]-a[j]>x then
        Begin
        If x<0 then
                inc(i)
        Else
                dec(j);
        End
        Else
        If -a[i]-a[j]<x then
        If x<0 then
                dec(j)
        Else
                inc(i);
        Until (i=n) or (j=y+1);
End;
Procedure Slove;
var
        i,j:longint;
Begin
        For i:=1 to n-3 do
        For j:=i+1 to n-2 do
                Bi_s(a[i]+a[j],j);
End;
Procedure OUTF;
var
        f:text;
Begin
        Assign(f,fo);
        Rewrite(f);
        writeln(f,dem);
        Close(f);
End;
Begin
        dem:=0;
        Enter;
        QS(1,n);
        Slove;
        OutF;
end.
