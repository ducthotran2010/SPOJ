const
        INP = '';
        OUT = '';
        OPERATORS = ['(', '+', '-', '*', ')'];
var
        strInfix, RPN: AnsiString;
procedure formatInfix;
        var
                i, j, count: Longint;
        begin
        while pos(' ', strInfix) <> 0 do
                delete(strInfix, pos(' ', strInfix), 1);

        strInfix := ' ' + strInfix + ' ';
        //============OPERATOR [-]===============
        for i := 1 to length(strInfix) do
        if strInfix[i] = '-' then
        if not(strInfix[i - 1] in ['0'..'9'] + [')']) then
                begin
                insert('(0', strInfix, i);
                j := i + 3;
                while j <= length(strInfix) do
                        begin
                        if not(strInfix[j] in ['0'..'9']) then
                                break;
                        j := j + 1;
                        end;
                insert(')', strInfix, j);
                end;
        //writeln(strInfix);
        //===========OPEATOR [abs]================
        i := 1;
        while i < length(strInfix) - 3 do
                begin
                if strInfix[i] + strInfix[i + 1] + strInfix[i + 2] + strInfix[i + 3] = 'abs(' then
                        begin
                        j := i + 4;
                        count := 1;
                        while j <= length(strInfix) do
                                begin
                                if strInfix[j] = '(' then
                                        count := count + 1
                                else
                                if strInfix[j] = ')' then
                                        count := count - 1;
                                if count = 0 then
                                        break;
                                j := j + 1;
                                end;
                        insert('abs', strInfix, j + 1);
                        delete(strInfix, i, 3);
                        end;
                i := i + 1;
                end;

        //writeln(strInfix);
        end;
procedure InfixtoRPN;
        var
                i, j: Longint;
                Stack: array of Char;
        function Pri(const c: Char): Longint;
                begin
                case c of
                        '*': exit(2);
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
                '+', '-', '*':
                        begin
                        while (high(Stack) >= low(Stack)) and (Pri(Token[1]) <= Pri(Stack[high(Stack)])) do
                                begin
                                RPN := RPN + Stack[high(Stack)] + ' ';
                                setlength(Stack, high(Stack));
                                end;
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
                else
                        RPN := RPN + Token + ' ';
                end;
        end;
        begin
        j := 0;
        for i := 1 to length(strInfix) do
        if strInfix[i] in OPERATORS + [' '] then
                begin
                if i > j + 1 then
                        processToken(copy(strInfix, j + 1, i - j - 1));
                if strInfix[i] in OPERATORS then
                        processToken(strInfix[i]);
                j := i;
                end;
        if j < length(strInfix[i]) then
                processToken(copy(strInfix, j + 1, length(strInfix) - j));
        while low(Stack) <= high(Stack) do
                begin
                RPN := RPN + Stack[high(Stack)] + ' ';
                setlength(Stack, high(Stack));
                end;
        //writeln(RPN);
        end;
procedure Solve;
        var
                i, j: Longint;
                Stack: array of Int64;
        procedure Push(const x: Int64);
                begin
                setlength(Stack, high(Stack) + 2);
                Stack[high(Stack)] := x;
                end;
        procedure processToken(const Token: AnsiString);
        var
                x, y: Int64;
                err: Longint;
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
                        end;
                end
        else
        if Token = 'abs' then
                Stack[high(Stack)] := abs(Stack[high(Stack)])
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
        writeln(Stack[high(Stack)]);
        end;
begin
        assign(input, INP);
        reset(input);
        readln(strInfix);
        close(input);
        formatInfix;
        InfixtoRPN;
        Solve;
end.