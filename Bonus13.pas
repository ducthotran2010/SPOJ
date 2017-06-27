const
        //inp='BONUS13.inp';
	inf=8;
        oo=1;
type
        cs=record
        x,y:byte;
        val:qword;
        found:boolean;end;
var
n:byte;
H,M,X,T:cs;
tmp,max:int64;
b,a:array[0..inf+1,0..inf+1] of longint;
ddf,dd:array[1..inf,1..inf] of boolean;
v:array[1..4] of byte;
d:array[1..4] of boolean;
procedure nhap;
	var
        //        f:text;
                z:longint;
                i,x,y:byte;
	begin
	//assign(f,inp);
	//reset(f);
        readln({f,}n);
        fillchar(dd,sizeof(dd),true);
	for i:= 1 to n do
		begin
		read({f,}x,y,z);
		a[x,y]:=z;
                dd[x,y]:=false;
		end;
	//close(f);
	end;
procedure init;
	var
		i:byte;
	begin
	for i:= 0 to inf+1 do
		begin
		a[0,i]:=-oo;
		a[inf+1,i]:=-oo;
		a[i,0]:=-oo;
		a[i,inf+1]:=-oo;
		end;
	end;
procedure format(x,y,i,j:shortint);
	begin
	if a[x+i,y+j]<>-oo then
		begin
		a[x+i,y+j]:=0;
		format(x,y,x+i,y+j);
		end;
	end;
procedure turn(x,y,i,j:shortint);
	begin
	if a[x+i,y+j]<>-oo then
		begin
                tmp:=tmp+a[x+i,y+j];
		turn(x,y,x+i,y+j);
		end;
	end;
procedure XLH;
	var
                i,j:byte;
	begin
	H.x:=0;
	H.y:=0;
        H.found:=false;
	H.val:=0;
	for i:= 1 to inf do
	for j:= 1 to inf do
        if dd[i,j] then
		begin
		tmp:=0;
		turn(-1,-1,i,j);
		turn(-1,0,i,j);
		turn(-1,1,i,j);
		turn(0,-1,i,j);
		turn(0,1,i,j);
		turn(1,-1,i,j);
		turn(1,0,i,j);
		turn(1,1,i,j);
		if tmp>=H.val then
			begin
                        H.found:=true;
			H.x:=i;
			H.y:=j;
			H.val:=tmp;
			end;
		end;
        if H.found then
        begin
        dd[h.x,h.y]:=false;
	format(-1,-1,H.x,H.y);
	format(-1,0,H.x,H.y);
	format(-1,1,H.x,H.y);
	format(0,1,H.x,H.y);
	format(0,-1,H.x,H.y);
	format(1,1,H.x,H.y);
	format(1,0,H.x,H.y);
        format(1,-1,H.x,H.y);
        end;
	end;
procedure XLX;
	var
		i,j:byte;
	begin
	X.x:=0;
	X.y:=0;
        x.found:=false;
	X.val:=0;
	for i:= 1 to inf do
	for j:= 1 to inf do
        if dd[i,j] then
		begin
		tmp:=0;
		turn(-1,0,i,j);
		turn(0,-1,i,j);
		turn(0,1,i,j);
		turn(1,0,i,j);
		if tmp>=X.val then
			begin
			X.x:=i;
			X.y:=j;
                        x.found:=true;
                        X.val:=tmp;
			end;
		end;
        if x.found then
        begin
        dd[x.x,x.y]:=false;
	format(-1,0,X.x,X.y);
	format(0,1,X.x,X.y);
	format(0,-1,X.x,X.y);
        format(1,0,X.x,X.y);
        end;
	end;
procedure XLT;
	var
		i,j:byte;
	begin
	T.x:=0;
	T.y:=0;
        t.found:=false;
	T.val:=0;
	for i:= 1 to inf do
	for j:= 1 to inf do
        if dd[i,j] then
		begin
		tmp:=0;
		turn(-1,-1,i,j);
		turn(-1,1,i,j);
		turn(1,-1,i,j);
		turn(1,1,i,j);
		if tmp>=T.val then
			begin
                        t.found:=true;
			T.x:=i;
			T.y:=j;
			T.val:=tmp;
			end;
		end;
        if t.found then
        begin
        dd[t.x,t.y]:=false;
	format(-1,-1,T.x,T.y);
	format(-1,1,T.x,T.y);
	format(1,1,T.x,T.y);
        format(1,-1,T.x,T.y);
        end;
	end;
procedure XLM;
	var
		i,j:byte;
	begin
	M.x:=0;
	M.y:=0;
        m.found:=false;
	M.val:=0;
	for i:= 1 to inf do
	for j:= 1 to inf do
        if dd[i,j] then
		begin
		tmp:=0;
		if i-2>0 then
			begin
			if j+1<=inf then inc(tmp,a[i-2,j+1]);
			if j-1>0 then inc(tmp,a[i-2,j-1]);
			end;
		if i-1>0 then
			begin
			if j+2<=inf then inc(tmp,a[i-1,j+2]);
			if j-2>0 then inc(tmp,a[i-1,j-2]);
			end;
		if i+1<=inf then
			begin
			if j+2<=inf then inc(tmp,a[i+1,j+2]);
			if j-2>0 then inc(tmp,a[i+1,j-2]);
			end;
		if i+2<=inf then
			begin
			if j+1<=inf then inc(tmp,a[i+2,j+1]);
			if j-1>0 then inc(tmp,a[i+2,j-1]);
			end;
		if tmp>=M.val then
			begin
                        m.found:=true;
			M.val:=tmp;
			M.x:=i;
			M.y:=j;
			end;
		end;
        if m.found then
        begin
        dd[m.x,m.y]:=false;
        if m.x-2>0 then
                begin
                if m.y+1<=inf then a[m.x-2,m.y+1]:=0;
                if m.y-1>0 then a[m.x-2,m.y-1]:=0;
		end;
	if m.x-1>0 then
	  	begin
	       	if m.y+2<=inf then a[m.x-1,m.y+2]:=0;
                if m.y-2>0 then a[m.x-1,m.y-2]:=0;
	       	end;
        if m.x+1<=inf then
	       	begin
                if m.y+2<=inf then a[m.x+1,m.y+2]:=0;
                if m.y-2>0 then a[m.x+1,m.y-2]:=0;
	       	end;
	if m.x+2<=inf then
	       	begin
                if m.y+1<=inf then a[m.x+2,m.y+1]:=0;
                if m.y-1>0 then a[m.x+2,m.y-1]:=0;
                end;
        end;
        // still no fixed
	end;
procedure tinh;
        var
                i:byte;
        begin // stil no restore a array
        a:=b;
        dd:=ddf;
        for i:= 1 to 4 do
                if v[i]=1 then XLH else
                if v[i]=2 then XLX else
                if v[i]=3 then XLT else
                               XLM;
        if h.found then
        if m.found then
        if t.found then
        if x.found then
        if H.val+M.val+T.val+X.val>max then
                max:=H.val+M.val+T.val+X.val;
	end;
procedure try(i:byte);
        var
                j:byte;
        begin
        for j:= 1 to 4 do
        if not d[j] then
                begin
                v[i]:=j;
                d[j]:=true;
                if i=4 then tinh else try(i+1);
                d[j]:=false;
                end;
        end;
begin
	nhap;
        init;
        b:=a;
        ddf:=dd;
        fillchar(d,sizeof(d),false);
        max:=0;
        try(1);
        writeln(max);
end.
