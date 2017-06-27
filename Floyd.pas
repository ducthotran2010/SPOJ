Uses crt;
Const
        Inputfile       ='Minpath.INP';
        Outputfile      ='Minpath.OUT';
        max             =100;
        maxC            =10000;
Var
        c:array[1..max,1..max] of integer;
        Trace:array[1..max,1..max] of integer;
        n,s,t:integer;
Procedure LoadGraph;
Var
        i,m,u,v:integer;
        fi:text;
Begin
        assign(fi,Inputfile);
        Reset(fi);
        Readln(fi,n,m,s,t);
        For u:=1 to n do
        For v:=1 to n do
        If u=v then
                c[u,v]:=0
        else
                c[u,v]:=maxC;
        For i:=1 to m do
                Begin
                        Readln(fi,u,v,c[u,v]);
                        c[v,u]:=c[u,v];
                End;
        Close(fi);
End;
Procedure Floyd;
Var
        k,u,v:integer;
Begin
        For u:=1 to n do
        For v:=1 to n do
                Trace[u,v]:=v;
        For k:=1 to n do
        For u:=1 to n do
        For v:=1 to n do
                If c[u,v]>c[u,k]+c[k,v] then
                        Begin
                                c[u,v]:=c[u,k]+c[k,v];
                                Trace[u,v]:=Trace[u,k];
                        End;
End;
Procedure PrintResult;
Var
        fo:text;
        i,j:integer;
Begin
        Assign(fo,Outputfile);
        Rewrite(fo);
        If c[s,t]=maxC
                Then Writeln(fo,'There is no path from: ',s,' to ',t)
        Else
                Begin
                        writeln(fo,'Distance from: ',s,' to ',t,' : ',c[s,t]);
                        Repeat
                                Write(fo,s,'->');
                                s:=trace[s,t];
                        Until s=t;
                Writeln(fo,t);
                end;
        Close(fo);
End;
Begin
        Clrscr;
        LoadGraph;
        Floyd;
        PrintResult;
End.
