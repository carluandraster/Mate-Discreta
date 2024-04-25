Program divisionEntera;

function techo (x:real):integer;
begin
    if x=trunc(x) then
        techo:=trunc(x)
    else
        if x>0 then
            techo:=trunc(x+1)
        else
            if x<0 then
                techo:=trunc(x);
end;

function piso (x:real):integer;
begin
    if x=trunc(x) then
        piso:=trunc(x)
    else
        if x>0 then
            piso:=trunc(x)
        else
            if x<0 then
                piso:=trunc(x-1);
end;

procedure ingresarDatos(var dividendo,divisor:integer);
begin
    writeLn('Ingrese dividendo: ');
    readLn(dividendo);

    writeLn('Ingrese divisor: ');
    readLn(divisor);
end;
    

var
    dividendo,divisor,cociente,resto:integer;

begin
    ingresarDatos(dividendo,divisor);
    while divisor<>0 do
    begin
        // Calcular cociente y resto
        if divisor>0 then
        begin
            cociente:=piso(dividendo/divisor);
        end
        else
        begin
            cociente:=techo(dividendo/divisor);
        end;
        resto:=dividendo-cociente*divisor;

        // Imprimir resultados
        writeLn('Cociente entero: ',cociente);
        writeLn('Resto: ',resto);

        // Pedir datos para la siguiente división
        ingresarDatos(dividendo,divisor);
    end;
end.