const
        inp='WINDOWP.inp';
        tex='WINDOWT.txt';
        out='WINDOW.out';
        maxn=1000000;
var
        s,sp:ansistring;
        n,kq,w,p:longint;
        l:array[0..maxn] of longint;
        d:array[0..255] of byte;
procedure input;
        var
                f:file of char;
                i:char;
                g:text;
        begin
        assign(g,inp);
        reset(g);
        readln(g,w,p);
        readln(g,sp);
        close(g);
        {-------INIT--------}
        for n:= 1 to p do d[ord(sp[n])]:=1;
        {-------INPUT-------}
        assign(f,tex);
        reset(f);
        n:=1;
        s:='';
        l[0]:=0;
        repeat
                read(f,i);
                if d[ord(i)]=1 then
                        l[n]:=l[n-1]+1
                else
                        l[n]:=l[n-1];
                s:=s+i;
                inc(n);
        until eof(f);
        n:=n-1;
        close(f);
        end;
procedure process;
        var
                j,i,z:longint;
        begin
        kq:=0;
        for i:= w to n do
        if l[i]-l[i-w]>=p then begin
                z:=i-w+1;
                for j:= 1 to p do
                while(s[z]<>sp[j])and(z<=i+1)do inc(z);
                if z<=i then inc(kq);
        end;
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,kq);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
