uses crt,windows;
const   inp='talent.in';
        out='talent.out';
var
        a:array[1..1500] of longint;
        n,k:word;
        ta:array[1..1500] of longint;
        kt:boolean;
        t:longint;
procedure nhap;
        var
                fi:text;
                i,j:word;
        begin
        assign(fi,inp);
        reset(fi);
        readln(fi,n);
        j:=0;
        for i:= 1 to n do readln(fi,a[i]);
        close(fi);
        end;
procedure ktp(j:longint);
        var
                k,l,i:byte;
                s:string;
                d:array['0'..'9'] of byte;
                ic:char;

        begin
        kt:=true;
        str(j,s);
        l:=length(s);
        if l>1 then
        begin
        fillchar(d,sizeof(d),0);
        k:=0;
        for i:= 1 to l do
                if s[i] in ['0'..'9'] then inc(d[s[i]]);
        for ic:= '0' to '9' do
                if d[ic] mod 2 <>0 then inc(k);
        if k>1 then kt:=false;
        end;
        end;
procedure test1;
        var i:word;
        begin
        for i:= 1 to n do
                begin
                ktp(a[i]);
                if kt then
                        begin
                        inc(k);
                        ta[k]:=a[i];
                        kt:=false;
                        end;
                end;
        writeln;
{        for i:= 1 to k do write(ta[i]:20);}
        end;
procedure test23;
        var i,j:word;
            l:array[1..1500] of byte;
            {ta2:array[1..1500] of longint;}
            {kt2:array[1..1500] of boolean; }
            maxl:byte;
            min:longint;
            s:string;
            f:text;
        begin
        for i:= 1 to k do
                begin
                str(ta[i],s);
                l[i]:=length(s);
                end;
        maxl:=0;
        j:=0;
        for i:= 1 to k do
                if l[i]>maxl then maxl:=l[i];
        for i:= 1 to k do
                if maxl=l[i] then
                        begin
                        inc(j);
                       { ta2[j]:=ta[i];}
                        min:=ta[i];

                       { writeln(ta[i]);}
                        end;
{        for i:= 1 to j do write(ta2[i]:20); }
        writeln;
        assign(f,out);
        rewrite(f);
        if j=1 then
                for i:= 1 to k do
                if maxl=l[i] then
                        begin
                        writeln(f,k,' ',ta[i]);
                        break;
                        end;

        if j>1 then
                begin
                for i:= 1 to k do
                if maxl=l[i] then
                if ta[i]<min then min:=ta[i];
                for i:= 1 to k do
                if min=ta[i] then
                        begin
                        writeln(f,k,' ',ta[i]);
                        end;
                end;
        close(f);


        end;
begin
        clrscr;
        t:=gettickcount;
        nhap;
        k:=0;
        test1;
        test23;
        writeln('time: ',(gettickcount-t)/1000:0:9);
        readln;
end.
