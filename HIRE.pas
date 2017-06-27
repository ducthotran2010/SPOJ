const
        inp = 'HIRE.inp';
        out = 'HIRE.out';
        maxn = 500000;
type
        typList = ^TList;
        TList = record
                intX, intV: longint;
                Link: typList;
                end;
var
        NewP: typList;
        ans, e, intFD, n, x, y: longint;
        ITc: array [1..maxn * 4] of typList;
        F, T: array[0..maxn + 1] of longint;
procedure init;
        var
                i: longint;
        begin
        e := n * 4;
        for i := 1 to e do
                ITc[i] := nil;
        end;
procedure proPutV(var List: typList);
        begin
        if List <> nil then
                begin
                if (x > List^.intX) and (T[x] >= List^.intV) then
                        exit
                else
                        proPutV(List^.Link);
                end
        else
                List := NewP;
        end;
procedure initV(l, r, k: longint);
        var
                m: longint;
        begin
        if l > y then
                exit;
        if r < x then
                exit;
        if x <= l then
        if r <= y then
                begin
                new(NewP);
                NewP^.link := nil;
                NewP^.intX := x;
                NewP^.intV := T[x];
                proPutV(ITc[k]);
                exit;
                end;
        m := (l + r) div 2;
        initV(l, m, k * 2);
        initV(m + 1, r, k * 2 + 1);
        end;
procedure input;
        var
                f: text;
                e: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        init;
        e := n + 1;
        for x := 2 to e do
                begin
                readln(f, y, T[x]);
                InitV(1, n, 1);
                if x = 2 then
                        intFD := y;
                end;
        close(f);
        end;
procedure proTakeV(k: longint);
        var
                Tmp: typList;
        begin
        Tmp := ITc[k];
        while Tmp <> nil do
                begin
                if ans > F[Tmp^.intX - 1] + Tmp^.intV then
                        ans := F[Tmp^.intX - 1] + Tmp^.intV;
                Tmp := Tmp^.link;
                end;
        end;
procedure GetV(l, r, k: longint);
        var
                m: longint;
        begin
        if l > x then
                exit;
        if r < x then
                exit;
        if l = x then
        if r = x then
                begin
                proTakeV(k);
                exit;
                end;
        m := (l + r) div 2;
        GetV(l, m, k * 2);
        GetV(m + 1, r, k * 2 + 1);
        proTakeV(k);
        end;
procedure process;
        begin
        F[1] := 0;
        if intFD = 1 then
                F[1] := T[2];
        for x := 2 to n do
                begin
                ans := maxlongint;
                GetV(1, n, 1);
                if ans = maxlongint then
                        ans := F[x - 1] + T[x + 1];
                F[x] := ans;
                end;
        end;
procedure prinf;
        var
                fo: text;
        begin
        assign(fo, out);
        rewrite(fo);
        writeln(fo, F[n]);
        close(fo);
        end;
begin
        input;
        process;
        prinf;
end.
