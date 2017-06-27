uses crt;
const
        fai=1; //fail status
        win=0; //win status
        maxdia=1000;
type
        mang=record
        bi,be:integer;
        // binary & before
        end;
var
        n:integer;
        cturning,firsttime:boolean;
        s:array[1..2] of integer;
        l:array[1..maxdia] of mang;
procedure nhap;
        begin
        randomize;
        repeat
        n:=random(maxdia)+1;
        until n>2;
        writeln('So dia ban dau: ',n);
        end;
procedure init;
        var
                i,j:integer;
        begin
        for i:= 1 to n do
                begin
                l[i].bi:=fai;
                l[i].be:=-1;
                end;
        for i:= 3 to n do
        for j:= 1 to trunc(sqrt(i)) do
                if i-j<>j then
                if l[j].bi xor l[i-j].bi=win then
                        begin
                        l[i].bi:=win;
                        l[i].be:=j;
                        end;
        end;
procedure pturn; //person's turn
        var
                y:byte;
        begin
        writeln(s[1],' vs. ',s[2]);
        writeln('*You:');
        repeat
                write('   Chon dong 1 hoac 2: ');
                readln(y);
        until ((y=1) or (y=2))and(s[y]>1);
        if y=1 then n:=s[1] else n:=s[2];
        repeat
                write('   Chia thanh: ');
                readln(s[1]);
                s[2]:=n-s[1];
        until s[1]*s[2]>0;
        writeln('   Ta duoc: ',s[1],' vs. ',s[2]);
        end;
procedure cturn; //computer's turn
        var
                did:boolean;
                k,i:byte;
                gt:integer;
        begin
        did:=false;
        if firsttime then
                begin
                writeln(n);
                writeln('*Computer:');
                if l[n].bi=win then
                        begin
                        did:=true;
                        gt:=l[n].be;
                        end;
                if not did then
                repeat
                        gt:=random(n);
                until n-gt<>gt;
                firsttime:=false;
                end
        else
                begin
                writeln(s[1],' vs. ',s[2]);
                writeln('*Computer:');
                for i:= 1 to 2 do
                if l[s[i]].bi=win then
                        begin
                        k:=i;
                        did:=true;
                        n:=s[i];
                        gt:=l[s[i]].be;
                        break;
                        end;
                if not did then
                        begin
                        repeat
                                k:=random(2)+1;
                        until s[k]>1;
                        n:=s[k];
                        repeat
                                gt:=random(n-1)+1;
                        until (n-gt<>gt)or(n=2);
                        end;
                writeln('   Chon dong: ',k,', co ',s[k],' dia');
                end;
        s[1]:=gt;
        s[2]:=n-gt;
        writeln('   Chia thanh: ',s[1],' vs. ',s[2]);
        end;
function con:boolean;
        var
                kt:boolean;
        begin
        if (n<=2)or(s[1]=s[2]) then kt:=false else kt:=true;
        con:=kt;
        end;
procedure display;
        begin
        writeln('Enter to continue');
        readln;
        clrscr;
        end;
begin
        clrscr;
        nhap;
        init;
        firsttime:=true;
        repeat
                display;
                cturning:=true;
                cturn;
                if not con then break;
                display;
                cturning:=false;
                pturn;
        until not con;
        if cturning then
                writeln('You win')
        else
                writeln('Computer win');
        readln;
end.
