const
        INP = 'Infix.inp';
        OUT = '';
        OPERATORS = ['+', '-', '*', '/', '(', ')'];
var
        strInfix, RPN: AnsiString;
        Stack: array of Char;
function Priority(const c: Char): longint;
        begin
        case c of
                '*', '/': exit(2);
                '+', '-': exit(1);
                '(', ')': exit(0);
                end;
        end;
procedure processToken(const strToken: AnsiString);
        var
                Kind, x: Char;
        begin
        Kind := strToken[1];
        case Kind of
                '(':
                        begin
                        setlength(Stack, high(Stack) + 2);
                        Stack[high(Stack)] := Kind;
                        end;
                ')':
                        repeat
                        x := Stack[high(Stack)];
                        setlength(Stack, high(Stack));
                        if x <> '(' then
                                RPN := RPN + x + ' ';
                        until x = '(';
                '+', '-', '*', '/':
                        begin
                        while (high(Stack) >= low(Stack)) and (Priority(Kind) <= Priority(Stack[high(Stack)])) do
                                begin
                                RPN := RPN + Stack[high(Stack)] + ' ';
                                setlength(Stack, high(Stack));
                                end;
                        setlength(Stack, high(Stack) + 2);
                        Stack[high(Stack)] := Kind;
                        end
                else
                        RPN := RPN + strToken + ' ';
                end;
        end;
procedure Solve;
        var
                i, j: longint;
        begin
        j := 0;
        RPN := '';
        for i := 1 to length(strInfix) do
        if strInfix[i] in OPERATORS + [' '] then
                begin
                if i > j + 1 then
                        processToken(copy(strInfix, j + 1, i - j - 1));
                if strInfix[i] in OPERATORS then
                        processToken(strInfix[i]);
                j := i;
                end;
        if j < length(strInfix) then
                processToken(copy(strInfix, j + 1, length(strInfix) - j));
        while high(Stack) >= low(Stack) do
                begin
                RPN := RPN + Stack[high(Stack)] + ' ';
                setlength(Stack, high(Stack));
                end;
        writeln(RPN);
        end;
begin
        assign(input, INP);
        reset(input);
        readln(strInfix);
        close(input);
        Solve;
end.