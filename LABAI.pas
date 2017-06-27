//Start code: 9:21 24/10/2014
//First run: 9:32 24/10/2014
const
        inp='LABAI.inp';
        out='LABAI.out';
        maxn=50;
type
        int=0..maxn;
var
        n,res:int;
        d:array[1..maxn] of boolean;
procedure IP;
        var
                f:text;
                i,x:int;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        res:=0;
        for i:= 1 to n do
                begin
                read(f,x);
                d[x]:=true;
                while d[res+1] do inc(res);
                end;
        close(f);
        end;
procedure prinf;
        var
                f:text;
                i:int;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,res);
        for i:= 1 to res do
        if i mod 10=0 then
                writeln(f,i,' ')
        else
                write(f,i,' ');
        close(f);
        end;
begin
        IP;
        prinf;
end.