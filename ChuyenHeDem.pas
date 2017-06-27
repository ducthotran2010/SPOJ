uses crt;
var
procedure inp;
        begin
        repeat
                write('Chuyen tu he dem: ');
                readln(x);
                write(' ,Sang he dem: ');
                readln(y);
        until ((x=2)or(x=8)or(x=10)or(x=16))and
              ((y=2)or(y=8)or(y=10)or(y=16));
        {............}
        end;
procedure tructiep;
        begin
        if (x=10)or(y=10) then
                begin

                end;
        end;
begin
        clrscr;
        inp;
