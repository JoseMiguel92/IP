PROGRAM prac6;
CONST
	OPCION1='a';
	OPCION2='b';
	OPCION3='c';
	OPCION4='d';
	OPCION5='e';
VAR
	opcion:char;
	num1,num_r_1,num_r_2,num_triangulo,num_par:integer;

PROCEDURE mostrarMenu;
	BEGIN{mostrarMenu}
		writeln('**********************************');
		writeln(' Autor: Jose Miguel Garcia Benayas');
		writeln('**********************************');
		writeln(' ');
		writeln(OPCION1,') Numero Defectuoso');
		writeln(OPCION2,') Rango De Numeros');
		writeln(OPCION3,') Triangulo De Numeros');
		writeln(OPCION4,') Total Par');
		writeln(OPCION5,') Terminar');
		writeln('Elige una opcion: ');
	END;{mostrarMenu}

FUNCTION leerNumero:integer;
	VAR
		n:integer;
	BEGIN {Leer Numero Entero}
		REPEAT
		writeln('Introduce un numero entero:');
		readln(n);
		UNTIL (n < MAXINT);
		leerNumero:=n;
	END;{Leer Numero Entero}

FUNCTION numero_defectuoso(numeroA:integer):boolean;
	VAR
		divisor,suma:integer;
	BEGIN{Numero Defectuoso}
		divisor:=numeroA DIV 2;
		suma:=0;
		REPEAT
		IF numeroA MOD divisor = 0 THEN
			suma:=suma+divisor;
		divisor:=divisor-1;
		UNTIL (divisor=0)OR(suma>numeroA);
		numero_defectuoso:=(numeroA>suma);
	END;{Numero Defectuoso}

PROCEDURE rango_numeros (VAR a,b:integer);
	VAR
		i:integer;
	BEGIN{rango_numeros}
	IF a < b THEN
		FOR i:=a TO b DO
			IF odd(i) THEN
				write(i,' ');
	IF (NOT b MOD 2 = 0) THEN
		b:=b+1;

	IF (NOT a MOD 2 = 0) THEN
		a:=a+1;
	END;{rango_numeros}

PROCEDURE triangulo_numeros(a:integer);
	VAR
	i,j:integer;
	BEGIN
		FOR i:=1 TO a DO
			BEGIN
				FOR j:=1 TO i DO
					write(i);
			writeln('');
			END;
	END;

FUNCTION total_par(numero_tp:integer):boolean;
	BEGIN{total_par}
	IF numero_tp MOD 2 <> 0 THEN
		total_par:=FALSE
	ELSE
		BEGIN{ELSE}
			REPEAT
				numero_tp:=numero_tp DIV 10
			UNTIL (numero_tp MOD 2 <> 0) OR (numero_tp = 0);
			IF numero_tp = 0 THEN
				total_par:=TRUE
			ELSE
				total_par:=FALSE;
		END;{ELSE}
	END;{total_par}

BEGIN{Programa Principal}
REPEAT
		mostrarMenu;
		readln(opcion);
		CASE opcion OF
			OPCION1:BEGIN{Numeros defectuosos}
						num1:= leerNumero;
						IF numero_defectuoso(num1) THEN
							writeln('El numero ',num1,' no es defectuoso.')
						ELSE
							writeln('El numero ',num1,' es defectuoso.');
					END;{Numeros defectuosos}

			OPCION2:BEGIN{Rango De Numeros}
						num_r_1:= leerNumero;
						num_r_2:= leerNumero;
						rango_numeros(num_r_1,num_r_2);
						writeln();
						writeln(num_r_1,' , ',num_r_2);

					END;{Rango De Numeros}

			OPCION3:BEGIN{Triangulo De Numeros}
						num_triangulo:= leerNumero;
						triangulo_numeros(num_triangulo);
					END;{Triangulo De Numeros}

			OPCION4:BEGIN{Total Par}
						REPEAT
						num_par:=leerNumero;
						IF NOT(num_par >=0) AND (num_par < MAXINT) THEN
							writeln('El numero debe ser postivo');
						UNTIL (num_par >=0) AND (num_par < MAXINT);
						IF total_par(num_par) THEN
							writeln('El numero ',num_par,' es total par.')
						ELSE
							writeln('El numero ',num_par,' no es total par.')
					END;{Total Par}

			OPCION5:BEGIN{Terminar}
						writeln('Gracias, para terminar pulsa INTRO');
					END;{Terminar}

		ELSE{CASE}
			writeln('Opcion no valida.');
		END;{CASE}
UNTIL (opcion=OPCION5);
readln();
END.{Programa Principal}