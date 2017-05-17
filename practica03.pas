PROGRAM	prac3;
CONST
	TEMPFRIO=18;
	TEMPAGRADABLE=28;
	TRAMO1=100;
	TRAMO2=600;
	TRAMO3=1100;
	ETRAMO1=0.15;
	ETRAMO2=0.2;
	ETRAMO3=0.35;
	ETRAMO4=0.8;
	LIM_1=2;
	LIM_2=3;
	LIM_3=5;
	LIM_4=6;
	LIM_5=10;
	PRECIO1=100.0;
	PRECIO2=90.0;
	PRECIO3=80.5;
	PRECIO4=60.0;
VAR
	temperatura,articulos: integer;
	consumo,pagar,total: real;
BEGIN
	writeln ('**********************************');
	writeln (' Autor: Jose Miguel Garcia Benayas');
	writeln ('**********************************');
	writeln (' ');
	writeln ('************ EL TIEMPO ***********');
	writeln ('Introduzca la temperatura:');
	readln (temperatura);
	IF (temperatura>TEMPAGRADABLE) THEN
		writeln ('Hace calor')
	ELSE IF (temperatura > TEMPFRIO) THEN
		writeln ('Hace un tiempo agradable')
	ELSE
		writeln ('Hace frio');

	writeln (' ');
	writeln ('******** PRECIO DEL AGUA *********');
	writeln('Introduzca el consumo de agua en metros cubicos: ');
	readln (consumo);
	IF (consumo<=TRAMO1) THEN
	BEGIN
		writeln('Primer tramo');
		pagar:=consumo*ETRAMO1
	END
	ELSE IF (consumo>TRAMO1) AND (consumo<=TRAMO2) THEN
	BEGIN
		writeln('Segundo tramo');
		pagar:=(TRAMO1*ETRAMO1)+(consumo-TRAMO1)*ETRAMO2;
	END
	ELSE IF (consumo>TRAMO2) AND (consumo<=TRAMO3) THEN
	BEGIN
		writeln('Tercer tramo');
		pagar:=((TRAMO1*ETRAMO1)+((TRAMO2-TRAMO1)*ETRAMO2)+((consumo-TRAMO2)*ETRAMO3));
	END
	ELSE
	BEGIN
		writeln('Cuarto tramo');
		pagar:=((TRAMO1*ETRAMO1)+((TRAMO2-TRAMO1)*ETRAMO2)+((TRAMO3-TRAMO2)*ETRAMO3)+(consumo-TRAMO3)*ETRAMO4);
	END;
	writeln('El precio a pagar es ',pagar:0:2,' euros.');

	writeln(' ');
	writeln ('****** PRECIO DE LA COMPRA *******');
	writeln('Introduzca el numero de articulos comprados: ');
	readln(articulos);
	CASE articulos OF
		0..LIM_1 : total:=(articulos*PRECIO1);
		LIM_2..LIM_3 : total:=(articulos*PRECIO2);
		LIM_4..LIM_5 : total:=(articulos*PRECIO3);
	ELSE
		total:=(articulos*PRECIO4)
	END;{CASE}
	writeln('El precio total de los articulos comprados es ',total:0:2,' euros.');
	readln();
END.