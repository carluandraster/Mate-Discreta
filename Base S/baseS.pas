Program baseS;

const
    tope=255;

type
    TV = array [1..tope] of byte;

// Subprogramas

Procedure de10aS (var sadico: TV; var N,S:byte);
var
    i:byte;
    x:word;
begin
    writeLn('Ingrese un numero de base decimal: ');
    readLn(x);

    repeat
        writeLn('Ingrese una base: ');
        readLn(S);
    until (S>1) and (S<36);

    if x=0 then
        N:=1
    else
        N:=trunc(ln(x)/ln(S)+1);
    
    for i:=N downto 1 do
    begin
        sadico[i]:= x mod S;
        x:= x div s;
    end;
end;

procedure imprimir (sadico: TV; N:byte);
var
    i:byte;
begin
    for i:=1 to N do
        if sadico[i]>=10 then
            write(chr(sadico[i]+55))
        else
            write(sadico[i]);
    writeLn();
end;

function potencia(x,n:byte):word;
    var
        i:byte;
        productoria:word;
    begin
        // Inicializar variables
            productoria:=1;
        
        // Calcular potencia
        for i:=1 to n do
          begin
            productoria:=productoria*x;
          end;
        
        // Retornar la productoria total
            potencia:=productoria;
    end;

procedure de_str_a_arr(x:string; var A:TV; var N:byte);
var
    i:byte;
begin
    N:=length(x);
    for i:=1 to N do
        if x[i] in ['0'..'9'] then
            val(x[i],A[i])
        else
            if (x[i] in ['A'..'Z']) or (x[i] in ['a'..'z']) then
            begin
                x[i]:=upcase(x[i]);
                A[i]:=ord(x[i])-55;
            end;
end;

function deCharAByte (x:char):byte;
begin
    if x in ['0'..'9'] then
        deCharAByte:=ord(x)-48
    else
        if (x in ['A'..'Z']) or (x in ['a'..'z']) then
        begin
            x:=upcase(x);
            deCharAByte:=ord(x)-55;
        end;
end;

function validar(x:string;S:byte):boolean;
var
    i,caracter:byte;
begin
    validar:=true;
    i:=1;
    caracter:=deCharAByte(x[i]);
    while (i<=length(x)) and (caracter>=0) and (caracter<S) do
    begin
        i:=i+1;
        caracter:=deCharAByte(x[i]);
    end;
        
    if i<=length(x) then
        validar:=false;
end;

function deSa10 (sadico: TV; N,S:byte):word;
var
    i:byte;
    suma:word;
begin
    suma:=0;
    for i:=1 to N do
        suma:=suma+sadico[i]*potencia(S,N-i);
    deSa10:=suma;
end;

procedure menu(var opcion:byte);
begin
    repeat
        writeLn('Ingrese una opcion: ');
        writeLn('1 - Pasar de base decimal a otra base numerica');
        writeLn('2 - Pasar de una base numerica a base decimal');
        writeLn('3 - Salir');
        readLn(opcion);
    until (opcion=1) or (opcion=2) or (opcion=3);
end;

// Programa principal

var
    sadico:TV;
    N,S,opcion:byte;
    num:string;
begin
    menu(opcion);

    while opcion<>3 do
    begin
        case opcion of
            1:
            begin
                de10aS (sadico, N, S);
                writeLn('Numero base ',S,': ');
                imprimir(sadico, N);
            end;
            2:  
            begin
                repeat
                    writeLn('Ingrese base: ');
                    readLn(S);
                until (S>1) and (S<36);

                repeat
                    writeLn('Ingrese numero: ');
                    readLn(num);
                until validar(num,S);
                
                de_str_a_arr(num, sadico, N);

                writeLn('Numero base 10: ',deSa10 (sadico, N,S));
            end; 
        end;

        menu(opcion);
    end;
end.