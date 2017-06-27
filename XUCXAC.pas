// Start time: 8:30am
// End time: 9:15am
const
        inp='XUCXAC.inp';
        out='XUCXAC.out';
        maxn=50;
        ban=-404;
type
        index=record
        l,r,u,d,f,b:byte;
        end;
var

        x:index;
        m,n,stax,stay,finx,finy:byte;
        min,maxs:longint;
        a:array[0..maxn+1,0..maxn+1] of integer;
procedure input;
        var
                f:text;
                i,j:byte;
        begin
        assign(f,inp);
        reset(f);
        readln(f,m,n);
        for i:= 1 to m do
        for j:= 1 to n do read(f,a[i,j]);
        read(f,stax,stay,finx,finy);
        close(f);
        for i:= 0 to m+1 do
                begin
                a[i,0]:=ban;
                a[i,n+1]:=ban;
                end;
        for i:= 0 to n+1 do
                begin
                a[0,i]:=ban;
                a[m+1,i]:=ban;
                end;
        end;
procedure turn(i,j,k,z:shortint;v:longint;xf,xb,xl,xr,xu,xd:byte;step:integer);
        begin
        if a[i+k,j+z]<>ban then
        if step<maxs then
                begin
                if finx=i+k then
                if finy=j+z then
                        if min>v+a[i,j] then min:=v+a[i,j]*xd;
                turn(i+k,j+z,0,1,v+a[i,j]*xd,xf,xb,xu,xd,xl,xr,step+1);
                turn(i+k,j+z,1,0,v+a[i,j]*xd,xf,xb,xu,xd,xl,xr,step+1);
                turn(i+k,j+z,0,-1,v+a[i,j]*xd,xf,xb,xu,xd,xl,xr,step+1);
                turn(i+k,j+z,-1,0,v+a[i,j]*xd,xf,xb,xu,xd,xl,xr,step+1);
                end;
        end;
procedure process;
        begin
        min:=high(longint);
        maxs:=m+n;
        x.f:=1;//font
        x.b:=6;//behind
        x.l:=3;//left
        x.r:=4;//right
        x.u:=2;//up
        x.d:=5;//down
        turn(stax,stay,0,1,0,x.f,x.b,x.u,x.d,x.l,x.r,0);
        turn(stax,stay,1,0,0,x.u,x.d,x.l,x.r,x.b,x.f,0);
        turn(stax,stay,0,-1,0,x.f,x.b,x.u,x.d,x.r,x.l,0);
        turn(stax,stay,-1,0,0,x.d,x.u,x.l,x.r,x.f,x.b,0);
        leftshift
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,min+x.d*a[stax,stay]);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
