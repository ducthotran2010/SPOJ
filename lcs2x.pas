const
        inp='lcs2x.inp';
        out='lcs2x.out';
        maxl=1500;
type
        mang=record
        t,i,j:array[0..maxl] of integer;
        sl:integer;
        end;
var
la,lb:integer;
a,b:array[0..maxl] of longint;
l: mang;
procedure input;
        var
                f,g:text;
                i,j:integer;
                t:int64;
        procedure qhd;
        var
                i,j,k,maxc:integer;
        begin
        l.sl:=0;
        maxc:=0;
        for i:= 1 to la do
        for j:= 1 to lb do begin
                if a[i]=b[j] then begin
                        inc(l.sl);
                        l.i[l.sl]:=i;
                        l.j[l.sl]:=j;
                        l.t[l.sl]:=1;
                        for k:= 1 to l.sl-1 do
                        if l.j[k]<j then
                        if l.i[k]<i then
                        if a[l.i[k]]*2<=a[i] then
                        if l.t[k]+1>l.t[l.sl] then
                                l.t[l.sl]:=l.t[k]+1;
                        if l.t[l.sl]>maxc then maxc:=l.t[l.sl];
                end;
        end;
        writeln(g,maxc);
        end;
        begin
        assign(f,inp);
        assign(g,out);
        rewrite(g);
        reset(f);
        readln(f,t);
        for i:= 1 to t do begin
                readln(f,la,lb);
                for j:= 1 to la do read(f,a[j]); readln(f);
                for j:= 1 to lb do read(f,b[j]); readln(f);
                qhd;
        end;
        close(f);
        close(g);
        end;
begin
        input;
end.














































