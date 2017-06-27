const
        maxn=500;
        inp='';
var
        m,n,x1,y1,x2,y2,min:integer;
        k:longint;
        a:array[1..maxn,1..maxn] of integer;
        f:array[0..maxn,0..maxn] of int64;
procedure input;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,m,n,k);
        for i:= 1 to m do
        for j:= 1 to n do
                read(f,a[i,j]);
        close(f);
        end;
procedure init;
        var
                i,j:integer;
        begin
        for i:= 1 to m do
        for j:= 1 to n do
                f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+a[i,j];
        end;
procedure process;
        var
                i,j,p,z,e:integer;
        begin
        for i:= 1 to m do
        for j:= i to m do
                begin
                e:=n;
                for p:= 1 to n do
                for z:= e downto p do
                        begin
                        if f[j,z]-f[i-1,z]-f[j,p-1]+f[i-1,p-1]>=k then
                        if (j-i+1)*(z-p+1)<min then
                                begin
                                min:=(j-i+1)*(z-p+1);
                                x1:=i;
                                y1:=p;
                                x2:=j;
                                y2:=z;
                                end
                        else else
                        //if f[j,z]-f[i,p]<k then
                                begin
                                e:=z+1;
                                if e>n then e:=n;
                                break;
                                end;
                        end;
                end;
        end;
procedure prinf;
        begin
        if min=maxint then
                write(-1)
        else
                begin
                writeln(min);
                write(x1,' ',y1,' ',x2,' ',y2);
                end;
        end;
begin
        input;
        init;
        min:=maxint;
        process;
        prinf;
end.

