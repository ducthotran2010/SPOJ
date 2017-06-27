{$MODE FPC}
{$20000000}
Var
        x:string;
        a:ansistring;
        n,m:longint;
        next:array[0..1000000] of longint;
Procedure init;
Var
        j,jj:longint;
Begin
        j:=1;
        jj:=0;
        Next[1]:=0;
        While (j<=n) do
                Begin
                        While (jj>0) and (x[j]<>x[jj]) do jj:=Next[jj];
                        inc(j);
                        inc(jj);
                        If x[j]=x[jj] then next[j]:=next[jj]
                        Else
                                Next[j]:=jj;
                End;
        for j:= 1 to n+1 do write(next[j]);
        writeln;
End;
procedure Process;
Var
        i,j:longint;
Begin
        init;
        i:=1;
        j:=1;
        Repeat
                While(j>0) and (x[j]<>a[i]) do
                        j:=next[j];
                inc(i);
                inc(j);
                If j>n then
                        Begin

                                Write(i-j+1);
                                j:=next[j];
                        End;
        Until i>m;

End;
Begin
        //readln(a);
        //readln(x);
        a:='1231231234';
        x:='1231234';
        n:=length(x);
        m:=length(a);
        process;
End.
