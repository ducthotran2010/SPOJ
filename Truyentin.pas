Const
        fi='TruyenTin.inp';
        fo='TruyenTin.out';
Type mang=array[0..100,0..100] of Longint;
Var
        GT_Min:Mang;
        s:array[0..100,0..100] of integer;
        M,N,I,J:integer;
        f:text;
        GT_NN:longint;
Procedure inp;
Var
        f:text;
        i,j:longint;
Begin
        {New(GT_Min);}
        Assign(f,fi);
        Reset(f);
        Readln(f,n,m);
        Fillchar(s,sizeof(s),0);
        For i:=1 to m do
        For j:=1 to n do
                Read(f,s[i,j]);
        Close(f);
End;
Procedure init;
Var
        i:integer;
Begin
        Fillchar(GT_Min,sizeof(GT_Min),0);
        For i:=1 to n do
                GT_min[1,i]:=s[1,i];
End;
Procedure QHD;
Var
        T:longint;
        k:integer;
Begin
        For i:=2 to M do
        For j:=1 to n do
                Begin
                        GT_min[i,j]:=GT_min[i-1,j];
                        For k:=j downto 0 do
                        If GT_min[i,j]>GT_min[i-1,k]+S[i,j-k] then
                        GT_min[i,j]:=GT_min[i-1,k]+s[i,j-k];
                End;
        GT_NN:=GT_Min[M,N];
        Write(GT_NN);
End;
Procedure Xuat(i:integer);
Var j:integer;
Begin
        If N>0 then
                Begin
                        j:=N;
                        While GT_Min[I,N]<>GT_Min[i-1,N-j]+s[i,j] do Dec(j);
                        N:=N-j;
                        Xuat(i-1);
                        Write(f,j,#32);
                End
        Else
                Begin
                        Writeln(f,GT_NN);
                        For j:=1 to I do write(F,0,#32);
                End;
End;
Procedure Outp;
Var
        luu,luu_tam:longint;
Begin
        Assign(f,fo);
        Rewrite(f);
        Luu:=M;
        For i:=M-1 downto 1 do
        If GT_min[I,N]=GT_min[luu,N] then Luu:=i;
        Luu_tam:=Luu;
        Xuat(Luu);
        For i:=luu_tam+1 to M do
                write(f,0,#32);
        Close(f);
        {Dispose(GT_MIN);}
End;
Begin
        inp;
        Init;
        QHD;
        Outp;
End.
