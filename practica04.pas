PROGRAM prac4;
CONST
	LIM1=90;
	LIM2=180;
	LIM3=270;
	LIM4=360;
	FC=PI/180;
	SIMBOLO='*';
VAR
	grados,n,i,signo,j,m:integer;
	suma:real;
BEGIN
	writeln('**********************************');
	writeln(' Autor: Jose Miguel Garcia Benayas');
	writeln('**********************************');
	writeln(' ');
	writeln('*********** CUADRANTE ************');
	REPEAT
		writeln('Introduzca el angulo en grado (entre 0 y 360):');
		readln(grados);
	UNTIL (grados >=0) AND (grados <=360);
	CASE grados OF
		0..LIM1-1: 		BEGIN
							writeln('Primer cuadrante');
							writeln('Seno (',grados,') = ',sin(grados*FC):0:3);
						END;
		LIM1..LIM2-1: 	BEGIN
							writeln('Segundo cuadrante');
							writeln('Coseno (',grados,') = ',cos(grados*FC):0:3);
						END;
		LIM2..LIM3-1: 	BEGIN
							writeln('Tercer cuadrante');
							writeln('Tangente (',grados,') = ',sin(grados*FC)/cos(grados*FC):0:3);
						END;
		LIM3..LIM4: 	BEGIN
							writeln('Cuarto cuadrante');
							writeln('Seno (',grados,') = ',sin(grados*FC):0:3);
							write('Tangente (',grados,') = ');
							IF (grados=LIM3)THEN
								writeln('Infinito negativo')
							ELSE
								writeln (sin(grados*FC)/cos(grados*FC):0:3)
						END;
	END; {CASE}
	writeln(' ');
	writeln('******** SUMA DE TERMINOS ********');
	REPEAT
		writeln('Introduzca el  numero de terminos a sumar:');
		readln(n);
	UNTIL n>=0;
	suma:=1;
	signo:=-1;
	FOR i:=1 TO n DO
	BEGIN
		suma:=suma+signo*(1/(2*i));
		signo:=-signo;
	END;
	writeln('La suma es ',suma:0:5);
	writeln(' ');
	writeln('*********** RECTANGULO ***********');
	writeln('Introduzca el numero de lineas:');
	readln(n);
	writeln('Introduzca el numero de caracteres:');
	readln(m);
	FOR i:=1 TO n DO
	BEGIN
		FOR j:=1 TO m DO
			write(SIMBOLO);
		writeln(' ');
	END;
	readln();
END.