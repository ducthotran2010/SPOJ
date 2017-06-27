const
        INP = '';
        OUT = '';
        MAXN = trunc(5e4);
        MAXL = trunc(1e4);
type
        TrieTree = ^TrieNode;
        TrieNode = record
                EIT, SEC: Longint;
                //EIT = Ended In This key
                //SEC = Sum all Ended of Child (not include this key)
                c: array[0..1] of TrieTree;
                end;
var
        t, p: TrieTree;
        i, j, k, m, n, x, res: Longint;
procedure add(var t: TrieTree);
        begin
        new(t);
        t^.EIT := 0;
        t^.SEC := 0;
        t^.c[0] := nil;
        t^.c[1] := nil;
        end;
begin
        add(t);
        assign(input, INP);
        reset(input);
        readln(m, n);
        for i := 1 to m do
                begin
                read(k);
                p := t;
                for j := 1 to k do
                        begin
                        read(x);
                        if p^.c[x] = nil then
                                add(p^.c[x]);
                        p := p^.c[x];
                        p^.SEC := p^.SEC + 1;
                        end;
                p^.EIT := p^.EIT + 1;
                p^.SEC := p^.SEC - 1;
                end;
        assign(output, OUT);
        rewrite(output);
        for i := 1 to n do
                begin
                res := 0;
                read(k);
                p := t;
                for j := 1 to k do
                        begin
                        read(x);
                        if p^.c[x] = nil then
                                begin
                                x := -1;
                                break;
                                end;
                        res := res + p^.c[x]^.EIT;
                        p := p^.c[x];
                        end;
                readln;
                if x <> - 1 then
                        res := res + p^.SEC;
                writeln(res);
                end;
        close(output);
end.
