{$1. Example about pointer tree:
        - Check if x in tree
        - Show tree
 $2. Show array tree}

{---------------------CONST----------------------}
uses crt;
const
        inp='TreeExample.inp';
{--------------------EXAMPLE---------------------}
{$1}
type
        tree=^re;
        re=record
        l,r:tree;info:integer;end;

var
        n,x:integer;
        t:tree;
        found:boolean;
procedure input;
        var
                f:text;
                i,v:integer;
        function create(x:integer;l,r:tree):tree;
                var
                        tmp:tree;
                begin
                new(tmp);
                tmp^.l:=l;
                tmp^.r:=r;
                tmp^.info:=x;
                create:=tmp;
                end;
        procedure insert(v:integer;var t:tree);
                begin
                if t=nil then t:=create(v,nil,nil)
                else
                        if v<t^.info then insert(v,t^.l)
                        else insert(v,t^.r);
                end;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do
                begin
                read(f,v);
                insert(v,t);
                write(v,' ');
                end;
        close(f);
        end;
procedure center(t:tree);
        begin
        if t<>nil then
                begin
                center(t^.l);
                write(t^.info,' ');
                center(t^.r);
                end;
        end;
procedure before(t:tree);
        begin
        if t<>nil then
                begin
                write(t^.info,' ');
                before(t^.l);
                before(t^.r);
                end;
        end;
procedure after(t:tree);
        begin
        if t<>nil then
                begin
                after(t^.l);
                after(t^.r);
                write(t^.info,' ');
                end;
        end;
procedure find(x:integer;t:tree);
        begin
        if t<>nil then
                begin
                if x<t^.info then find(x,t^.l) else
                if x=t^.info then
                        begin
                        writeln('Found');
                        found:=true;
                        end
                else    find(x,t^.r);
                end;
        end;
begin
        write('Array: ');input;writeln;
        write('Before: ');before(t);writeln;
        write('Center: ');center(t);writeln;
        write('After: ');after(t);writeln;
        {
        write('Find x in tree: ');
        readln(x);
        find(x,t);
        if not found then writeln('Not found');
        }
        readln;
end.
{$2}
{
const
        oo=low(integer);
        n=255; //max button
type
        tree=record
        used:boolean;
        info:integer;end;
        atree=array[0..n] of tree;
var
        t:atree;
procedure input;
        var
                f:text;
                i:byte;
                x:integer;
        procedure create(x:integer;locate:byte);
                begin
                t[locate].used:=true;
                t[locate].info:=x;
                end;
        procedure insert(x:integer;locate:byte);
                begin
                if not t[locate].used then create(x,locate) else
                if x<t[locate].info then insert(x,locate * 2) else
                insert(x,(locate * 2)+1);
                end;
        begin
        assign(f,inp);
        reset(f);
        readln(f,t[0].info);
        //fillchar(t.used,sizeof(t.used),false);
        t[0].used:=true; //t[0] is number button of array
        for i:= 1 to t[0].info do
                begin
                read(f,x);
                write(x,' ');
                insert(x,1);
                end;
        close(f);
        end;
procedure before(locate:byte);
        begin
        if t[locate].used then
                begin
                write(t[locate].info,' ');
                before(locate * 2);
                before((locate * 2)+1);
                end;
        end;
procedure center(locate:byte);
        begin
        if t[locate].used then
                begin
                center(locate * 2);
                write(t[locate].info,' ');
                center((locate * 2)+1);
                end;
        end;
procedure after(locate:byte);
        begin
        if t[locate].used then
                begin
                after(locate * 2);
                after((locate * 2)+1);
                write(t[locate].info,' ');
                end;
        end;
begin
        clrscr;
        write('Array: ');input;writeln;
        write('Before: ');before(1);writeln;
        write('Center: ');center(1);writeln;
        write('After: ');after(1);writeln;
        readln;
end.
}