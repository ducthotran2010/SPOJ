var a,b:longint;
function ktnt(n:longint):boolean;
	var
	i:integer;
	kt:boolean;
	begin
	kt:=true;
	for i:= 2 to trunc(sqrt(n)) do
	if n mod i=0 then
		begin
		kt:=false;
		break;
		end;
	ktnt:=kt;
	end;
procedure xuli;
	var i:longint;
	begin
	if a=1 then inc(a);
	for i:= a to b do
	if ktnt(i) then writeln(i);
	end;
begin
	read(a,b);
	xuli;
end.
