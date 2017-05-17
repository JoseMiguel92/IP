PROGRAM prac8;
CONST
	OPCION1='a';
	OPCION2='b';
	OPCION3='c';
	OPCION4='d';
VAR
	opcion:char;
	num_e,cifra,pos,n1,n2:integer;
	num_b:real;


PROCEDURE mostrarMenu;
BEGIN{mostrarMenu}
	writeln();
	writeln('**********************************');
	writeln(' Autor: Jose Miguel Garcia Benayas');
	writeln('**********************************');
	writeln(' ');
	writeln(OPCION1,') Potencia.');
	writeln(OPCION2,') Cifra i-esima.');
	writeln(OPCION3,') Maximo comun divisor.');
	writeln(OPCION4,') Terminar');
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

FUNCTION potencia(base:real;exponente:integer):real;
BEGIN{POTENCIA}
IF exponente=0 THEN
	potencia:=1
ELSE IF odd(exponente) THEN
	potencia:=base*potencia(base,exponente-1)
ELSE
	potencia:=potencia(base*base,exponente DIV 2);
END;{POTENCIA}


FUNCTION numero_cifras (numero:integer):integer;
VAR
	acum:integer;
BEGIN{NUMERO DE CIFRAS DE UN NUMERO}
	acum:=0;
REPEAT
	numero:=numero DIV 10;
	acum:=acum+1
UNTIL numero=0;
numero_cifras:=acum;
END;{NUMERO DE CIFRAS DE UN NUMERO}


FUNCTION cifra_iesima (numero,posicion:integer):integer;
BEGIN{SUBPROGRAMA CIFRAIESIMA}
	IF posicion=0 THEN
		cifra_iesima:=numero MOD 10
	ELSE
		IF numero=0 THEN
			cifra_iesima:=numero MOD 10
		ELSE
			cifra_iesima:=cifra_iesima(numero DIV 10,posicion-1);
END;{SUBPROGRAMA CIFRAIESIMA}


FUNCTION mcd(a,b:integer):integer;
BEGIN{MCD}
	IF a>b THEN
		mcd:=mcd(a-b,b)
	ELSE IF a<b THEN
		mcd:=mcd(a,b-a)
	ELSE IF a=b THEN
		mcd:=a;
END;{MCD}


{##### COMIENZO DEL PROGRAMA PRINCIPAL #####}

BEGIN{Programa Principal}
REPEAT
		mostrarMenu;
		readln(opcion);
		CASE opcion OF
			OPCION1:BEGIN{###POTENCIA}
						writeln;
						writeln('Base de la potencia');
						num_b:=leerReal;
						writeln('Exponente de la potencia');
						num_e:=leerInteger;
						writeln(potencia(num_b,num_e):0:1);
						writeln;
					END;{POTENCIA###}

			OPCION2:BEGIN{###CIFRA I-ESIMA}
						writeln;
						writeln('Cifra');
						REPEAT
						cifra:=leerInteger;
						IF cifra<0 THEN
							writeln('Debe ser un numero entero positivo');
						UNTIL (cifra>=0);
						writeln('Elige una posicion, comprendida entre [0 y ',numero_cifras(cifra)-1,'].');
						pos:=leerInteger;
						writeln('La cifra correspondiente a la posicion ',pos,' del numero ',cifra,' es: ',cifra_iesima(cifra,pos));
					END;{CIFRA I-ESIMA###}

			OPCION3:BEGIN{###Maximo Comun Divisor}
						writeln('Maximo Comun Divisor');
						n1:=leerInteger;
						n2:=leerInteger;
						writeln('El Maximo Comun Divisor de ',n1,' y ',n2,' es: ',mcd(n1,n2),'.');
					END;{Maximo Comun Divisor###}

			OPCION4:BEGIN{Terminar}
						writeln('Gracias, Pulse Intro para finalizar.');
					END;{Terminar}

		ELSE{CASE}
			writeln('Opcion no valida.');
		END;{CASE}
UNTIL (opcion=OPCION4);
readln();
END.{Programa Principal}