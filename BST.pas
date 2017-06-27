const
        inp = 'BST.inp';
        out = 'BST.out';
type
        typTree = ^TTree;
        TTree = record
                intV: longint;
                left, right: typTree;
                end;
var
        t: typTree;
procedure delete(var t: typTree);
        var
                y: typTree;
        procedure findMaxium(var f: typTree);
                begin
                if f <> nil then
                        begin
                        if y^.intV < f^.intV then
                                y := f;
                        findMaxium(f^.left);
                        findMaxium(f^.right);
                        if y^.intV = f^.intV then
                                begin
                                t^.intV := f^.intV;
                                Delete(f);
                                end;
                        end;
                end;
        begin
        if (t^.left <> nil) and (t^.right <> nil) then
                begin
                new(y);
                y^.left := nil;
                y^.right := nil;
                y^.intV := 0;
                findMaxium(t^.left);
                dispose(y);
                exit;
                end;
        y := nil;
        if t^.left <> nil then
                y := t^.left
        else
                y := t^.right;
        t := y;
        dispose(y);
        end;
procedure input;
        var
                f: text;
                v: longint;
        procedure insert(var t: typTree);
                begin
                if t = nil then
                        begin
                        new(t);
                        t^.left := nil;
                        t^.right := nil;
                        t^.intV := v;
                        end
                else
                if v < t^.intV then
                        insert(t^.left)
                else
                if v > t^.intV then
                        insert(t^.right)
                else
                        delete(t);
                end;
        begin
        assign(f, inp);
        reset(f);
        while not eof(f) do
                begin
                read(f, v);
                insert(t);
                end;
        close(f);
        end;
procedure Duyet(t: typTree);
        begin
        if t <> nil then
                begin
                Duyet(t^.left);
                writeln(t^.intV);
                Duyet(t^.right);
                end;
        end;
begin
        input;
        Duyet(t);
end.
