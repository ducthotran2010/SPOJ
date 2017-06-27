Const
        maxI=20000;
        max=10000;
        fi='Flood.inp';
        fo='flood.out';
        hi:array[1..4] of integer=(0,1,0,-1);
        hj:array[1..4] of integer=(-1,0,1,0);
Var
        q1,q2:array[0..150] of record d,c:longint End;
        d1,d2,c1,c2,n,m,li,lj:longint;
        tmp:array[0..150,0..150] of char;
        a:char;
        b:array[0..150,0..150] of integer;
        tt,st,kt:boolean;
Procedure inp;
Var
        f:text;
        i,j,dem:longint;
Begin
        d1:=1;
        c1:=1;
        d2:=1;
        c2:=1;
        Assign(f,fi);
        reset(f);
        Readln(f,m,n);
        For i:=0 to n+1 do
                Begin
                        b[i,0]:=max;
                        b[i,m+1]:=max;
                End;
        For i:=0 to m+1 do
                Begin
                        b[0,i]:=max;
                        b[n+1,i]:=max;
                End;
        For i:=1 to n do Begin
        dem:=0;
        While dem<m do
                Begin
                        inc(dem);
                        Read(f,a);
                        if a='S' then
                        Begin
                                Q1[c1].d:=i;
                                Q1[c1].c:=dem;
                                b[i,dem]:=1;
                        End;
                        If a='D' then
                                Begin
                                        li:=i;
                                        lj:=dem;
                                        b[i,dem]:=maxI;
                                        tmp[i,dem]:='D';
                                End;
                        If a='.' then
                                b[i,dem]:=1;
                        If a='*' then
                        Begin
                                Q2[c2].d:=i;
                                q2[c2].c:=dem;
                                b[i,dem]:=0;
                                kt:=true;
                        End;
                        If a='X' then
                                b[i,dem]:=10000;
                End;
        Readln(f);
        End;
End;
Procedure LoangRoad;
Var
        i,j,k,h,c:longint;
Begin
        j:=c1;
        For  i:=d1 to c1 do
        For k:=1 to 4 do
                Begin
                        h:=q1[i].d+hi[k];
                        c:=q1[i].c+hj[k];
                        If b[h,c]=1 then
                                Begin
                                        inc(j);
                                        q1[j].d:=h;
                                        q1[j].c:=c;
                                        {v[h,c]:=true;}
                                        {}
                                End;
                        If b[h,c]=maxI then
                                Begin
                                        b[h,c]:=b[q1[i].d,q1[i].c]+1;
                                        TT:=true;
                                        Exit;
                                End
                        Else
                        If b[h,c]=1 then
                        b[h,c]:=b[q1[i].d,q1[i].c]+1;


                End;
        d1:=c1+1;
        c1:=j;
        If d1>c1 then
                St:=true;
End;
Procedure LoangFlood;
Var
        i,j,k,h,c:longint;
Begin
        j:=c2;
        For i:=d2 to c2 do
        For k:=1 to 4 do
         Begin
                h:=q2[i].d+hi[k];
                c:=q2[i].c+hj[k];
                If (b[h,c]<>0) and (tmp[h,c]<>'D') and (b[h,c]<>10000) then
                        Begin
                                inc(j);
                                q2[j].d:=h;
                                q2[j].c:=c;
                                b[h,c]:=0;
                        End;
                {If (b[li,lj-1]=0) and (b[li,lj+1]=0) and (b[li+1,lj]=0) and (b[li-1,lj]=0) then
                Begin
                        TT:=true;
                        Exit;
                End;}
         End;
         d2:=c2+1;
         c2:=j;
         If d2>c2 then ST:=true;
End;
Procedure Loang;
Begin
        St:=false;
        TT:=false;
        While (TT=false) and (St=false) do
        Begin
                If kt then
                Begin
                LoangFlood;
                LoangRoad;
                End
                Else
                        LoangRoad;
        End;
End;
Procedure Outp;
Var
        f:text;
Begin
        Assign(f,fo);
        Rewrite(f);
        If TT=False then
                Writeln(f,'#')
        Else
        Writeln(f,b[li,lj]);
        CLose(f);
End;
Begin
        Inp;
        Loang;
        outp;
End.
