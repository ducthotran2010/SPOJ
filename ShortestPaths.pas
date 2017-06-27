program Breadth_First_Search;
const
   InputFile  = 'PATH.INP';
   OutputFile = 'PATH.OUT';
   max = 100;
var
   a: array[1..max, 1..max] of Boolean;
   Trace: array[1..max] of Integer;
   n, s, f: Integer;

procedure Enter;
   var
   i, u, v, m: Integer;
   fi: Text;
   begin
   Assign(fi, InputFile);
   Reset(fi);
   FillChar(a, SizeOf(a), False);
   ReadLn(fi, n, m, s, f);
   for i := 1 to m do
     begin
       ReadLn(fi, u, v);
       a[u, v] := True;
       a[v, u] := True;
       end;   Close(fi);
   end;
procedure BFS;
   var
   Queue: array[1..max] of Integer;
   Front, Rear, u, v: Integer;
   begin
   Front := 1;
   Rear := 1;
   Queue[1] := s;
   FillChar(Trace, SizeOf(Trace), 0);
   Trace[s] := -1;
   repeat
        u:= Queue[Front];
        Inc(Front);
        for v := 1 to n do
                if a[u, v] and (Trace[v] = 0)then
                begin
                Inc(Rear);
                Queue[Rear] := v;
                Trace[v] := u;
                end;
   until Front > Rear;
   end;
procedure Result;
   var
   fo: Text;
   v: Integer;
   begin
   Assign(fo, OutputFile);
   Rewrite(fo);
   if Trace[f] = 0 then
     WriteLn(fo,'not found')
   else
     begin
       while f <> s do
         begin
           Write(fo, f, ' ');
           f := Trace[f];
         end;
         WriteLn(fo, s);
     end;
   Close(fo);
end;
begin
   Enter;
   BFS;
   Result;
end.
