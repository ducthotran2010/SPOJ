const
        inp='VBGRASS.inp';
        out='VBGRASS.out';
        max=100;
var
        a:array[0..max+1,0..max+1] of char;
        //d:array[1..max,1..max] of boolean;
        n,m:byte;
        count:integer;
procedure nhap;
        var
                {f:text;}
                i,j:byte;
        begin
        {assign(f,inp);
        reset(f);}
        readln({f,}n,m);
        //fillchar(a,sizeof(a),'.');
        for i:= 1 to n do
                begin
                for j:= 1 to m do
                        //begin
                        //d[i,j]:=false;
                        read({f,}a[i,j]);
                        //end;
                readln{(f)};
                end;
        //close(f);
        end;
procedure turn(i,j,z,k:shortint);
        begin
        if a[i+z,j+k]='#' then
                begin
                inc(i,z);
                inc(j,k);
                //d[i,j]:=true;
                a[i,j]:='.';
                turn(i,j,-1,0);
                turn(i,j,0,-1);
                turn(i,j,0,1);
                turn(i,j,1,0);
                end;
        end;
procedure xuli;
        var
                i,j:byte;
        begin
        count:=0;
        for i:= 1 to n do
        for j:= 1 to m do
        if a[i,j]='#' then
        //if not d[i,j] then
                begin
                inc(count);
                //d[i,j]:=true;
                a[i,j]:='.';
                turn(i,j,-1,0);
                turn(i,j,0,-1);
                turn(i,j,0,1);
                turn(i,j,1,0);
                end;
        end;
begin
        nhap;
        xuli;
        write(count);
end.