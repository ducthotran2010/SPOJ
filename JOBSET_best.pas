Const
        fi='Jobset.inp';
Var
        c:array[0..502,0..502] of longint;
        q:array[0..10000] of RECORD d,c:longint End;
        a:array[0..502] of longint;
        v:array[0..502] of boolean;
        n,m,s,t,sum,tong:longint;
Procedure inp;
Var
        f:text;
        i:longint;
Begin
        {Assign(f,fi);
        Reset(f);}
        Readln({f,}n);
        For i:=1 to n do
                Read({f,}a[i]);
                //a[i]:=random(1000000)-random(1000000);
        Readln({f,}m);
        For i:=1 to m do
                Read({f,}q[i].d,q[i].c);
End;
Procedure Init;
var
        i,j:longint;
Begin
        s:=0;
        t:=n+1;
        Fillchar(c,sizeof(c),0);
        {A[s]:=maxint;
        A[t]:=-maxint;}
        For i:=1 to n do
        If a[i]>0 then
                C[s,i]:=1
        Else
                C[i,t]:=1;
        For i:=1 to m do
                C[q[i].d,q[i].c]:=1;
        {For i:=s to t do
        Begin
        Writeln;
        For j:=s to t do
                Write(c[i,j],#32);
        End;}
End;
Procedure DFS(x:longint);
Var
        i:longint;
Begin
        For i:=1 to n+1 do
        If (c[x,i]=1) and (v[i]) then
                Begin
                v[i]:=false;
                tong:=tong+a[i];
                DFS(i);
                End;
End;
Procedure Solve;
Var
        i:longint;
Begin
        Fillchar(v,sizeof(v),true);
        Sum:=0;
        tong:=0;
        For i:=0 to n+1 do
        If (v[i]) then
                Begin
                If tong>sum then
                        sum:=sum+tong;
                DFS(i);
                End;
End;
Begin
        inp;
        init;
        Solve;
        Writeln(Sum);
End.
