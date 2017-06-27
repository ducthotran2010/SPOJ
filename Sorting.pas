uses crt;
const
        inp='Sort.inp';
        out='Sort.out';
        bt=8;
        max=2;
var
        a:array[0..max] of byte;
        f:text;
procedure finish;
        var
                i,j:longint;
        Function Laybit(x,j:longint):byte;
                begin
                Laybit:=(x shr j) and 1;
                end;
        begin
        assign(f,out);
        rewrite(f);
        for i:= 0 to max do
        for j:= 0 to bt-1 do
        If laybit(a[i],j)=1 then writeln(f,(i*bt+j));
        close(f);
        end;
procedure Start;
        var
                i,tg:longint;
                count:byte;
        procedure batbit(x,y:longint);
                begin
                a[x]:=a[x] or (1 shl y);
                end;
        begin
        count:=0;
        fillchar(a,sizeof(a),0);
        assign(f,inp);
        reset(f);
        while not seekeof(f) do
                begin
                read(f,tg);
                batbit(tg div bt,tg mod bt);
                inc(count);
                write(count,'. ');
                for i:= 0 to max do
                        write(a[i],' ');
                writeln;
                end;
        close(f);
        end;
begin
        Start;
        finish;
end.
