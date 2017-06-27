const
        inp = 'SEQ.inp';
        out = 'SEQ.out';
        maxN = 100000;
type
        arr = record
                l, v: int64;
                end;
var
        n, b: int64;
        a: array[1..maxN] of arr;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, b);
        for i := 1 to n do
                begin
                read(a[i].v);
                a[i].l := i;
                end;
        close(input);
        end;
procedure sort(l,r: longint);
      var
         i,j: longint;
         x: int64;
         y: arr;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2].v;
         repeat
           while a[i].v<x do
            inc(i);
           while x<a[j].v do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
procedure process;
        var
                x: int64;
                i, j, i0, Lx, Rx: longint;

        function SearchV: longint;
                var
                        l, r, m: longint;
                begin
                l := 1;
                r := n;
                repeat
                        m := (l + r) shr 1;
                        if a[m].v > x then
                                r := m - 1
                        else
                        if a[m].v < x then
                                l := m + 1
                        else
                                exit(m);
                until l > r;
                exit(0);
                end;
        function searchL: longint;
                var
                        res, l, r, m: longint;
                begin
                l := 1;
                r := i0;
                res := i0;
                repeat
                        m := (l + r) shr 1;
                        if a[m].v >= x then
                                begin
                                r := m - 1;
                                res := m;
                                end
                        else
                                l := m + 1;
                until l > r;
                exit(res);
                end;
        function searchR: longint;
                var
                        res, l, r, m: longint;
                begin
                l := i0;
                r := n;
                res := i0;
                repeat
                        m := (l + r) shr 1;
                        if a[m].v > x then
                                r := m - 1
                        else
                                begin
                                l := m + 1;
                                res := m;
                                end;
                until l > r;
                exit(res);
                end;
        begin
        for i := 1 to n do
                begin
                Lx := n;
                Rx := 1;
                x := b + a[i].v;
                i0 := searchV;
                if i0 <> 0 then
                        begin
                        Lx := searchL;
                        Rx := searchR;
                        end;
                for j := Lx to Rx do
                if a[i].l <> a[j].l then
                        begin
                        writeln(a[j].l, ' ', a[i].l);
                        close(output);
                        halt;
                        end;
                end;
        end;
begin
        enter;
        sort(1, n);
        assign(output, out);
        rewrite(output);
        process;
        write(0, ' ', 0);
        close(output);
end.
