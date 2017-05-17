PROGRAM prac7;
CONST
	OPCION1='a';
	OPCION2='b';
	OPCION3='c';
	OPCION4='d';
	OPCION5='e';
VAR
	opcion:char;
	n1:integer;
	n2:real;
	x1,x2,y1,y2:integer;
PROCEDURE mostrarMenu;
	BEGIN{mostrarMenu}
		writeln('**********************************');
		writeln(' Autor: Jose Miguel Garcia Benayas');
		writeln('**********************************');
		writeln(' ');
		writeln(OPCION1,') Polinomio de Hermite Recursivo.');
		writeln(OPCION2,') Polinomio de Hermite Iterativo.');
		writeln(OPCION3,') Numero de caminos.');
		writeln(OPCION4,') Distancia Maxima.');
		writeln(OPCION5,') Terminar');
		writeln('Elige una opcion: ');
	END;{mostrarMenu}

FUNCTION leerInteger:integer;
VAR
	n:integer;
BEGIN {Leer Numero Entero}
	REPEAT
	writeln('Introduce un numero entero:');
	readln(n);
	UNTIL (n < MAXINT);
	leerInteger:=n;
END;{Leer Integer}

FUNCTION leerReal:real;
VAR
	n:real;
BEGIN{Leer Real}
	writeln('Introduce un numero real: ');
	readln(n);
	leerReal:=n;
END;{Leer Real}

PROCEDURE leerCoordenadas(VAR x,y:integer);
BEGIN{Leer Coordenadas}
	writeln('Introduce el valor de X: ');
	readln(x);
	writeln('Introduce el valor de Y: ');
	readln(y);
END;{Leer Coordenadas}

FUNCTION hermite_recursivo (n:integer; x:real):real;
BEGIN{Hermite recursivo}
	IF n=0 THEN
		hermite_recursivo:=1
	ELSE IF n=1 THEN
		hermite_recursivo:=2*x
	ELSE
		hermite_recursivo:=(2 * x * hermite_recursivo(n-1, x) - 2 * (n-1) * hermite_recursivo(n-2,x));
END;{Hermite recursivo}

FUNCTION hermite_iterativo (n:integer; x:real):real;
VAR
	i:integer;
	acum,h1,h2:real;
BEGIN{Hermite iterativo}
	IF (n=0) THEN
		hermite_iterativo:=1
	ELSE IF (n=1) THEN
		hermite_iterativo:=2*x
	ELSE BEGIN
		h2:=1;
		h1:=2*x;
			FOR i:=2 TO n DO BEGIN
				acum:=2 * x * h1 - 2 * (i-1) * h2;
				h2:=h1;
				h1:=acum;
			END;{FOR}
			hermite_iterativo:=acum;
		END;
END;{Hermite iterativo}

FUNCTION numero_caminos(cx1,cy1,cx2,cy2:integer):integer;
	BEGIN{numero de caminos}
	IF (cx1=cx2) AND (cy1=cy2) THEN
		numero_caminos:=0
	ELSE IF (cx1=cx2) OR (cy1=cy2) THEN
		numero_caminos:=1
	ELSE
		numero_caminos:=numero_caminos(cx1+1,cy1,cx2,cy2) + numero_caminos(cx1,cy1+1,cx2,cy2);
	END;{numero de caminos}

FUNCTION distancia (bidones:integer;km:real):real;
	BEGIN{distancia}
		IF bidones=1 THEN
			distancia:=km
		ELSE IF bidones=2 THEN
			distancia:=2*km
		ELSE
			distancia:= distancia((bidones-1),km) + (km/(2*bidones-3)) ;
	END;{distancia}

BEGIN{Programa Principal}
REPEAT
		mostrarMenu;
		readln(opcion);
		CASE opcion OF
			OPCION1:BEGIN{Hermite Recursivo}
						n1:=leerInteger;
						n2:=leerReal;
						writeln(hermite_recursivo(n1,n2):0:0);
					END;{Hermite Recursivo}

			OPCION2:BEGIN{Hermite Iterativo}
						n1:=leerInteger;
						n2:=leerReal;
						writeln(hermite_iterativo(n1,n2):0:0);
					END;{Hermite Iterativo}

			OPCION3:BEGIN{Numero de caminos}
						writeln('Valor X del origen');
						x1:=leerInteger;
						writeln('Valor Y del origen');
						y1:=leerInteger;
						writeln('Valor X del destino');
						x2:=leerInteger;
						writeln('Valor Y del destino');
						y2:=leerInteger;
						writeln('El numero de caminos desde (',x1,',',y1,') hasta (',x2,',',y2,') es: ',numero_caminos(x1,y1,x2,y2));
					END;{Numero de caminos}

			OPCION4:BEGIN{Distancia total}
						REPEAT
							n1:=leerInteger;
						UNTIL n1>0;
						n2:=leerReal;
						writeln('La distancia total que puede recorrer con ',n1,' bidones es: ',distancia(n1,n2):0:2);
					END;{Distancia total}

			OPCION5:BEGIN{Terminar}
						writeln('Gracias, Pulse Intro para finalizar.');
					END;{Terminar}

		ELSE{CASE}
			writeln('Opcion no valida.');
		END;{CASE}
UNTIL (opcion=OPCION5);
readln();
END.{Programa Principal}