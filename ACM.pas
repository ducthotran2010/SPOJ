{uses crt;
const
        inp='ACM.INP';
        out='ACM.OUT';}
type
        mang=record
        a,b,h:shortint;
        end;
var
        n:qword;
        f:array[1..2*4*100000] of mang;
procedure nhap;
        var
                {fi:text;}
                i:longint;
        begin
        {assign(fi,inp);
        reset(fi);}
        read({fi,}n);
        for i:= 1 to 2*n do
                begin
                read({fi,}f[i].a,f[i].b);
                f[i].h:=f[i].a-f[i].b;
                end;
        {close(fi);}
        end;
procedure quicksort(l,h:qword);
        var
                i,j:qword;
                x:shortint;
                t:mang;

        begin
        i:= l;
        j:= h;
        x:=f[(l+h) div 2].h;
        repeat
                while f[i].h<x do inc(i);
                while x<f[j].h do dec(j);
                if i<=j then
                        begin
                        t:=f[i];
                        f[i]:=f[j];
                        f[j]:=t;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if i<h then quicksort(i,h);
        if j>l then quicksort(l,j);
        end;
procedure xl;
        var
                t:qword;
                i:longint;
                fi:text;
        begin
{        for i:= 1 to 2*n do write(f[i].h);}
        t:=0;
        for i:= 1 to 2*n do
                if i<=n then t:=t+f[i].a else t:=t+f[i].b;
        {assign(fi,out);
        rewrite(fi);}
        write({fi,}t); {
        close(fi); }
        end;
begin
        {clrscr;}
        nhap;
        quicksort(1,2*n);
        xl;
        {readln;}
end.
