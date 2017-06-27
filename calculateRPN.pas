const
        INP = 'RPN.inp';
        OUT = 'RPN.out';
        OPERATORS = ['+', '-', '*', '/'];
var
        RPN: AnsiString;
        Stack: array of real;
procedure Push(const x: real);
        begin
        setlength(Stack, high(Stack) + 2);
        Stack[high(Stack)] := x;
        end;
procedure processToken(const Token: AnsiString);
        var
                x, y: real;
                err: longint;
        begin
        if Token[1] in OPERATORS then
                begin
                y := Stack[high(Stack)];
                x := Stack[high(Stack) - 1];
                setlength(Stack, high(Stack) - 1);
                case Token[1] of
                        '+': Push(x + y);
                        '-': Push(x - y);
                        '*': Push(x * y);
                        '/': Push(x / y);
                        end;
                end
        else
                begin
                val(Token, x, err);
                Push(x);
                end;
        end;
procedure Solve;
        var
                i, j: longint;
        begin
        j := 0;
        for i := 1 to length(RPN) do
        if RPN[i] in OPERATORS + [' '] then
                begin
                if i > j + 1 then
                        processToken(copy(RPN, j + 1, i - j - 1));
                if RPN[i] in OPERATORS then
                        processToken(RPN[i]);
                j := i;
                end;
        if j < length(RPN) then
                processToken(copy(RPN, j + 1, length(RPN) - j));
        end;
begin
        assign(input, INP);
        reset(input);
        readln(RPN);
        close(input);
        Solve;
        writeln(Stack[high(Stack)]:0:4);
end.