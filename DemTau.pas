uses crt;
const
        inp='Demtau.Inp';
        out='Demtau.Out';
var
        tau,n,m:word;
procedure nhap;
        var
                f:text;
                i:integer;
                a,b:array[1..100] of byte;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,m);
        tau:=0;
        fillchar(a,sizeof(a),0);
        while not seekeof(f) do
                begin
                b:=a;
                for i:= 1 to m do read(f,a[i]);
                for i:= 1 to m do
                if a[i]=1 then
                if a[i+1]=0 then
                if b[i]=0 then
                if b[i+1]=0 then
                        inc(tau);
                end;
        close(f);
        end;
procedure ghikq;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        write(f,tau);
        close(f);
        end;
begin
        nhap;
        ghikq;
end.
