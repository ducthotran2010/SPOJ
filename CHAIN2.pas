{$MODE OBJFPC}
const
        INP = '';
        OUT = 'CHAIN2.OUT';
        MAXM = trunc(25e4);
type
        TrieTree = ^TrieNode;
        TrieNode = record
                count: Longint;
                c: array['a'..'z'] of TrieTree;
                end;
var
        t: TrieTree;
        res: Longint;
procedure add(var a: TrieTree);
        var
                i: Char;
        begin
        new(a);
        a^.count := 0;
        for i := 'a' to 'z' do
                a^.c[i] := nil;
        end;
procedure enter;
        var
                p: TrieTree;
                s: Ansistring;
                i, j, m: Longint;
        begin
        assign(input, INP);
        reset(input);
        readln(m);
        for i := 1 to m do
                begin
                readln(s);
                p := t;
                for j := 1 to length(s) do
                        begin
                        if p^.c[s[j]] = nil then
                                add(p^.c[s[j]]);
                        p := p^.c[s[j]];
                        end;
                p^.count := p^.count + 1;
                end;
        close(input);
        end;

function max(a, b: Longint): Longint; inline;
        begin if a > b then max := a else max := b; end;

function getRes(t: TrieTree): Longint;
        var
                i: Char;
        begin
        result := 0;
        for i := 'a' to 'z' do
        if t^.c[i] <> nil then
                result := max(result, getRes(t^.c[i]) + t^.c[i]^.count);
        end;
begin
        add(t);
        enter;
        res := getRes(t);
        writeln(res);
end.