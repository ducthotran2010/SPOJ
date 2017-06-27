const
        INP = '';
        OUT = 'Expression.out';
        OPERATORS = ['+', '-', '*', '/', '(', ')'];
var
        strInfix, RPN: AnsiString;

procedure InfixtoRPN;
        var
                i, j: longint;
                Stack: array of Char;
        function Pri(const c: Char): longint;
                begin
                case c of
                        '*', '/': exit(2);
                        '+', '-': exit(1);
                        '(': exit(0);
                        end;
                end;
        procedure processToken(const Token: AnsiString);
                var
                        x: Char;
                begin
                case Token[1] of
                        '(':
                                begin
                                setlength(Stack, high(Stack) + 2);
                                Stack[high(Stack)] := Token[1];
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
                                while (high(Stack) >= low(Stack)) and (Pri(Token[1]) <= Pri(Stack[high(Stack)])) do
                                        begin
                                        RPN := RPN + Stack[high(Stack)] + ' ';
                                        setlength(Stack, high(Stack));
                                        end;
                                setlength(Stack, high(Stack) + 2);
                                Stack[high(Stack)] := Token[1];
                                end
                        else
                                RPN := RPN + Token + ' ';
                        end;
                end;
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
        //---------------------------------
        while high(Stack) >= low(Stack) do
                begin
                RPN := RPN + Stack[high(Stack)] + ' ';
                setlength(Stack, high(Stack));
                end;
        writeln(RPN);
        end;
procedure Calculate;
        var
                i, j: longint;
                Stack: array of real;
        procedure Push(const x: real);
                begin
                setlength(Stack, high(Stack) + 2);
                Stack[high(Stack)] := x;
                end;
        procedure processToken(const Token:AnsiString);
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
        writeln(Stack[high(Stack)]:0:2);
        end;
begin
        assign(input, INP);
        reset(input);
        readln(strInfix);
        close(input);
        //formatInfix;
        InfixtoRPN;
        Calculate;
end.
