{Dada una matriz cuadrada NxN, calcular potencia}

Program potenciaMatriz;

const
    TOPE = 20;

type
    TM = array [1..TOPE,1..TOPE] of byte;

// Subprogramas

procedure leerArchivo (var MATRIZ: TM; var N: byte);
var
    archivo: text;
    i,j: byte;
begin
    // Abrir archivo de texto
    assign(archivo,'matriz.txt');
    reset(archivo);

    // Leer archivo
    read(archivo,N);
    for i:=1 to N do
        begin
            readLn(archivo);
            for j:=1 to N do
                read(archivo,MATRIZ[i,j]);
        end;
    
    // Cerrar archivo
    close(archivo);
end;

procedure multiplicar(A,B: TM; var C: TM; N: byte);
var
    i,j,k: byte;
begin
    for i:=1 to N do
        for j:=1 to N do
            begin
                C[i,j]:=0;
                for k:=1 to N do
                    C[i,j]:=C[i,j]+A[i,k]*B[k,j];
            end;
end;

procedure potencia (A: TM; N: byte; x: byte; var RESULTADO: TM);
var
    res: TM;
begin
    if x=1 then
        RESULTADO:=A
    else
        begin
            potencia(A,N,x-1,res);
            multiplicar(res,A,RESULTADO,N);
        end;
end;

procedure mostrarMatriz (RESULTADO: TM; N: byte);
var
    i,j: byte;
begin
    for i:=1 to N do
        begin
            for j:=1 to N do
                write(RESULTADO[i,j],' ');
            writeLn;
        end;
end;

// Programa principal

var
    MATRIZ,RESULTADO: TM;
    x,N: byte;

begin
    // Ingresar matriz por texto
    leerArchivo(MATRIZ,N);

    // Ingresar por teclado y validar exponente
    repeat
        writeLn('Ingrese exponente: ');
        readLn(x);
    until x>0;

    // Procesar y mostrar datos
    potencia(MATRIZ,N,x,RESULTADO);
    mostrarMatriz(RESULTADO,N);
end.