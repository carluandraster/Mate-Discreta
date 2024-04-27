Program mcdmcm;

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

function mcm(a,b:integer):word;
var
    maxComDiv:word;
begin
    maxComDiv:=mcd(a,b);
    if maxComDiv<>0 then
        mcm:=abs(a*b) div maxComDiv
    else
        mcm:=0;
end;

procedure entrada (var a,b:integer);
begin
    writeLn('Ingrese un par de numeros: ');
    readLn(a);
    readLn(b);
end;

// Programa principal

var
    a,b:integer;

begin
    entrada(a,b);
    while (a<>0) or (b<>0) do
    begin
        writeLn('MCD(',a,',',b,') = ',mcd(a,b));
        writeLn('MCM(',a,',',b,') = ',mcm(a,b));
        entrada(a,b);
    end;
end.