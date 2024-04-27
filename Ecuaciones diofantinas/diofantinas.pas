Program resolverEcuacionDiofantina;

// Dado ax+by=c, hallar, si es posible, una solución particular, siendo x,y ∈ Z

// Subprogramas

function resto (dividendo,divisor:integer):word;
begin
    if dividendo>0 then
        resto:= dividendo mod abs(divisor)
    else
        if dividendo<0 then
            resto:= abs(divisor) + dividendo mod divisor
        else
            resto:=0;
end;

function mcd(a,b:integer):word;
var
    res:word;
begin
    if b<>0 then
    begin
        repeat
            res:=resto(a,b);
            a:=b;
            b:=res;
        until res=0;

        mcd:=a;
    end 
    else
        mcd:=abs(a);    
end;

function Fy (a,b,c:integer;x:word):real;
begin
    Fy:=(c-a*x)/b
end;

procedure entrada (var a,b,c: integer);
begin
    writeLn('Dada la ecuacion diofantina ax+by=c, ingrese en orden alfabetico los valores de a, b y c: ');
    readLn(a);
    readLn(b);
    readLn(c);
end;

// Programa principal

var
    a,b,c: integer;
    x: word;
    y:real;
    respuesta: char;

begin
    repeat
        entrada(a,b,c);
        if c mod mcd(a,b) = 0 then
        begin
            x:=0;
            y:=Fy(a,b,c,x);
            while y<>trunc(y) do
            begin
                x:=x+1;
                y:=Fy(a,b,c,x);
            end;
                
            writeLn('Solucion particular: x=',x,', y=',y:0:0);
        end
        else
            writeLn('No existe solucion porque mcd(a,b) no divide a c');
        
        repeat
            writeLn('Desea continuar? (S o N)');
            readLn(respuesta);
            respuesta:=upcase(respuesta);
        until (respuesta='S') or (respuesta='N');
    until respuesta='N';
end.