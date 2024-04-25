Program divisionEntera;

procedure ingresarDatos(var dividendo,divisor:integer);
begin
    writeLn('Ingrese dividendo: ');
    readLn(dividendo);

    writeLn('Ingrese divisor: ');
    readLn(divisor);
end;
    

var
    dividendo,divisor:integer;

begin
    ingresarDatos(dividendo,divisor);
    while divisor<>0 do
    begin
        // Imprimir respuestas
        writeLn('Cociente entero: ',dividendo div divisor);
        writeLn('Resto: ',dividendo mod divisor);

        ingresarDatos(dividendo,divisor);
    end;
end.