{Escribir las condiciones que debería analizar un programa (en lenguaje Pascal o similar) que
lea la matriz de adyacencia de un grafo de hasta 5 vértices y determine si es o no conexo.}

Program ejercicio16;

const
    TOPE = 5;

type
    TM = array[1..TOPE,1..TOPE] of byte;

// Subprogramas

procedure leerArchivo (var A: TM; var N: byte);
var
    archivo: text;
    i,j: byte;
begin
    // Abrir archivo
    assign(archivo,'matriz.txt');
    reset(archivo);

    // Leer archivo
    read(archivo,N);
    for i:=1 to N do
        begin
            readLn(archivo);
            for j:=1 to N do
                read(archivo,A[i,j]);
        end;
    
    // Cerrar archivo
    close(archivo);
end;

// Dados 2 matrices A y B, obtener su producto C

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

// Elevar a la x-ésima potencia una matriz

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

// Dados 2 matrices, obtener su suma

procedure sumar (A,B: TM; N: byte; var SUMA: TM);
var
    i,j: byte;
begin
    for i:=1 to N do
        for j:=1 to N do
            SUMA[i,j]:=A[i,j]+B[i,j];
end;

// Obtener matriz C

procedure sumaDePotencias (A: TM; N,pot: byte; var C: TM);
var
    resP,resC,sum: TM;
begin
    if pot = 1 then
        C:=A
    else
        begin
            potencia(A,N,pot,resP);
            sumaDePotencias(A,N,pot-1,resC);
            sumar(resP,resC,N,sum);
            C:=sum;
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

// Dada una matriz, decir si tiene 0

function tiene0 (C: TM; N: byte): boolean;
var
    i,j: byte;
begin
    // Inicializar variables
    i:=1;
    j:=1;

    // Recorrer matriz
    while (i<=N) and (C[i,j]<>0) do
        begin
            while (j<=N) and (C[i,j]<>0) do
                j:=j+1;
            if C[i,j]<>0 then
                begin
                    i:=i+1;
                    j:=1; 
                end;
        end;
    
    // Devolver resultado
    tiene0:=C[i,j]=0;
end;


// Programa principal

var
    A,C: TM;
    N: byte;

begin
    // Cargar matriz de archivo
    leerArchivo(A,N);

    // Obtener C
    sumaDePotencias (A, N,N-1, C);

    // Devolver resultado
    if tiene0(C,N) then
        writeLn('La matriz corresponde a un grafo no conexo.')
    else
        writeLn('La matriz corresponde a un grafo conexo.');
end.