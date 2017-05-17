PROGRAM prac5;
CONST
	OPCION1='a';
	OPCION2='b';
	OPCION3='c';
VAR
	opcion:char;
	base,limite,i,n,d:integer;
PROCEDURE mostrarMenu;{mostrarMenu}
	BEGIN
		writeln('**********************************');
		writeln(' Autor: Jose Miguel Garcia Benayas');
		writeln('**********************************');
		writeln(' ');
		writeln(OPCION1,') Multiplos Sinceros');
		writeln(OPCION2,') Numeros Colegas');
		writeln(OPCION3,') Finalizar');
	END;{mostrarMenu}
PROCEDURE multiploSincero (numeroBase,numI:integer);
	VAR
		cifra,acumuladorCifra,numero:integer;
	BEGIN
		cifra:=0;
		acumuladorCifra:=0;
		numero:=numI;
	REPEAT
		cifra:= numero MOD 10;
		acumuladorCifra:=cifra+acumuladorCifra;
		numero:=numero DIV 10;
	UNTIL (numero = 0) OR ( acumuladorCifra > numeroBase);
	IF (acumuladorCifra = numeroBase) THEN
	 write(numI,',');
	END;

FUNCTION numerosColegas (num,cifra:integer):boolean;
	VAR
	ultimaCifra,primeraCifra:integer;
	BEGIN
		ultimaCifra:=num MOD 10;
		IF ultimaCifra<>cifra THEN
	    	numerosColegas:=FALSE
	    ELSE
	    	REPEAT
	    		primeraCifra:= num MOD 10;
	    		num:=num DIV 10;
	    	UNTIL (num=0);
	    	numerosColegas:=(primeraCifra=ultimaCifra);
	END;
	BEGIN{Programa Principal}
	REPEAT
		mostrarMenu;
		writeln('Elige una opcion: ');
		readln(opcion);
		CASE opcion OF
			'a':	BEGIN{Multiplos sinceros}
					REPEAT
						writeln('Introduce un numero base:');
						readln(base);
					UNTIL (base>=0) AND (base<=9);
					REPEAT
						writeln('Introduce un numero limite:');
						readln(limite);
					UNTIL (limite>=0) AND (limite<=MAXINT);
					writeln('Los multiplos sinceros son: ');
					FOR i:=base TO limite DO
						IF (i MOD base = 0) THEN
							multiploSincero(base,i);
					writeln(' ');
					END;{Multiplos sinceros}

			'b':	BEGIN{Numeros colegas}
						REPEAT
						writeln('Introduce un numero entero postivo:');
						readln(n);
						UNTIL (n>=0) AND (n<=MAXINT);
						REPEAT
						writeln('Introduce un numero de una cifra');
						readln(d);
						UNTIL (d>0)AND(d<=9);
						IF (numerosColegas(n,d)) THEN
							writeln('El numero ',n,' y la cifra ',d,' son colegas.')
						ELSE
							writeln('El numero ',n,' y la cifra ',d,' no son colegas.');
					END;{Numeros colegas}

			'c':writeln('Gracias');
		ELSE
			writeln('Opcion no valida.');
		END;
	UNTIL (opcion=OPCION3);
readln();
END.{Programa Principal}