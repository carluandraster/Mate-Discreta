Program baseS;

// Subprogramas

procedure ingresar10(x:word;S:byte)
begin
    writeLn('Ingrese un numero de base decimal: ');
    readLn(x);

    repeat
        writeLn('Ingrese una base: ');
        readLn(S);
    until S>1; 
end;

function de10aS (x,S:byte): string;
var
    i,resto,N:byte;
    x:word;
begin
    if x=0 then
        N:=1
    else
        N:=trunc(ln(x)/ln(S)+1);
    
    for i:=N downto 1 do
    begin
        resto:= x mod S;
        if resto>=10 then
            de10aS[i]:=chr(resto+55)
        else
            de10aS[i]:=chr(resto+48);
        x:= x div s;
    end;
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
        
    if (caracter<0) or (caracter>=S) then
        validar:=false;
end;

function deSa10 (sadico: string; S:byte):word;
var
    N,i,numero:byte;
    suma:word;
begin
    suma:=0;
    N:=length(sadico);
    for i:=1 to N do
    begin
        numero:=deCharAByte(sadico[i]);
        suma:=suma+numero*potencia(S,N-i);
    end;
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
    S,opcion:byte;
    sadico,num:string;
begin
    menu(opcion);

    while opcion<>3 do
    begin
        case opcion of
            1:
            begin
                de10aS (sadico, S);
                writeLn('Numero base ',S,': ');
                writeLn(sadico);
            end;
            2:  
            begin
                sadico:='';
                repeat
                    writeLn('Ingrese base: ');
                    readLn(S);
                until S>1;

                repeat
                    writeLn('Ingrese numero: ');
                    readLn(num);
                until validar(num,S);

                writeLn('Numero base 10: ',deSa10 (sadico, S));
            end; 
        end;

        menu(opcion);
    end;
end.