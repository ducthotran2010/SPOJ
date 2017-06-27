const
        maxn=100;
        maxk=10000;
        inp='NETSUM.inp';
        out='NETSUM.out';
type
        index=record
        x,y:shortint;
        end;
var
        n:byte;
        m:integer;
        max:longint;
        a:array[0..maxn+1,0..maxn+1] of integer;
        trace,luu:array[1..maxk] of index;
procedure input;
        var
                f:text;
                i,j:byte;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        for i:= 1 to n do
        for j:= 1 to n do read(f,a[i,j]);
        close(f);
        for i:= 0 to n+1 do
                begin
                a[i,0]:=-1;
                a[0,i]:=-1;
                a[i,n+1]:=-1;
                a[n+1,i]:=-1;
                end;
        end;
procedure turn(i,j,k,z:shortint;step:integer;val:longint);
        begin
        if a[i+k,j+z]<>-1 then
                begin
                trace[step].x:=i+k;
                trace[step].y:=j+z;
                if step=m then
                        begin
                        val:=val+a[i+k,j+z];
                        if val>max then
                                begin
                                max:=val;
                                luu:=trace;
                                end;
                        end
                else begin
                turn(i+k,j+z,1,0,step+1,val+a[i+k,j+z]);
                turn(i+k,j+z,0,1,step+1,val+a[i+k,j+z]);
                turn(i+k,j+z,-1,0,step+1,val+a[i+k,j+z]);
                turn(i+k,j+z,0,-1,step+1,val+a[i+k,j+z]);
                end;end;
        end;
procedure process;
        begin
        max:=0;
        m:=m-1;
        turn(1,1,1,0,1,0);
        turn(1,1,0,1,1,0);
        end;
procedure prinf;
        var
                f:text;
                i:integer;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,max+a[1,1]);
        writeln(f,1,' ',1);
        for i:= 1 to m do writeln(f,luu[i].x,' ',luu[i].y);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
