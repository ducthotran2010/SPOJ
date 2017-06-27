uses crt;
const n=5;
//type
  //      ten=record

var i,j:integer;
    ten:array[1..n] of string=('canh','can','ca','c','a');
    ho:array[1..n] of string=('123','321','121','331','151');
    //s:array[1..n] of string;

procedure sapxep;
var i,j,l: integer;
    t:string;
begin
     for i:=1 to n do
         for j:=1 to n do
         begin
             t := ten[i]+ho[i];
             if ten[i]<ten[j] then
             begin
                  t:=ten[i];
                  ten[i]:=ten[j];
                  ten[j]:=t;
             end;
         end;
end;
begin
     clrscr;
     //for i:=1 to n do
     //begin
       //   write('nhap ho hoc vien thu ',i); readln(ho[i]);
       //   write('nhap ten : '); readln(ten[i]);
     //end;
     sapxep;
     for i:=1 to n do
     begin
          write(ho[i],' ',ten[i]);
          writeln;
     end;
     readln
end.


