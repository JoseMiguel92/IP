PROGRAM prac9;
CONST
	OPCION1=1;
	OPCION2=2;
	OPCION3=3;
	OPCION4=4;
	OPCION5=5;
	OPCION6=6;
	OPCION7=7;
	OPCION8=8;
	OPCION9=9;
	OPCION10=10;
	OPCION11=11;
	OPCION12=12;
	INI=1;
	FIN=31;

TYPE
	tRango=INI..FIN;
	tDatos=ARRAY[tRango]OF integer;

VAR
	opcion,num_buscado,dia:integer;
	datos:tDatos;

PROCEDURE mostrarMenu;
BEGIN{mostrarMenu}
	writeln();
	writeln('**********************************');
	writeln(' Autor: Jose Miguel Garcia Benayas');
	writeln('**********************************');
	writeln();
	writeln(OPCION1,') Introducir las variaciones del precio de todo el mes.');
	writeln(OPCION2,') Mostrar las variaciones de todos los dias del mes.');
	writeln(OPCION3,') Calcular la media.');
	writeln(OPCION4,') Mostrar el dia que la subida fue maxima.');
	writeln(OPCION5,') Mostrar el dia que la bajada fue maxima.');
	writeln(OPCION6,') Modificar la variacion de un dia concreto.');
	writeln(OPCION7,') Calcular el periodo mayor de subida de precio.');
	writeln(OPCION8,') Calcular el numero de cambios entre dias consecutivos.');
	writeln(OPCION9,') Mostrar si todo el mes ha tenido bajadas.');
	writeln(OPCION10,') Mostrar si cada dia ha tenido una variacion mayor o igual a la anterior.');
	writeln(OPCION11,') Buscar una variacion.');
	writeln(OPCION12,') Finalizar');
	writeln('Elige una opcion: ');
END;{mostrarMenu}

FUNCTION leerInteger:integer;
VAR
	n:integer;
BEGIN {Leer Numero Entero}
	REPEAT
	writeln('Introduce un numero entero:');
	readln(n);
	UNTIL (n > -MAXINT)OR(n < MAXINT);
	leerInteger:=n;
END;{Leer Numero Entero}

PROCEDURE pedirDatos (VAR Pdatos:tDatos);
	VAR
		i:integer;
	BEGIN
		FOR i:=INI TO FIN DO
			BEGIN
				writeln('Introduce las variaciones del dia ',i);
				readln(Pdatos[i]);
			END;
	END;{pedirDatos}

PROCEDURE mostrarDatos (Pdatos:tDatos);
	VAR
		i:integer;
	BEGIN
		FOR i:=INI TO FIN DO
			BEGIN
				writeln('Dato correspondiente al dia ',i,': ',Pdatos[i]);
			END;
	END;{mostrarDatos}

FUNCTION sumaDatos (Pdatos:tDatos):integer;
	VAR
		i,total:integer;
	BEGIN
		total:=0;
		FOR i:=INI TO FIN DO
			BEGIN
				total:=total+Pdatos[i];
			END;
		sumaDatos:=total;
	END;{sumaDatos}

FUNCTION buscarDato (Pdatos:tDatos; numero:integer):integer;
	VAR
		i:integer;
		encontrado:boolean;
	BEGIN
		i:=pred(INI);
		REPEAT
			i:=succ(i);
			encontrado:=numero=Pdatos[i];
		UNTIL (encontrado) OR (i=FIN);
		IF encontrado THEN
			buscarDato:=i
		ELSE
			buscarDato:=0;
	END;{buscarDato}

PROCEDURE modificacionDato (VAR Pdatos:tDatos; dia_mod:integer);
	VAR
		i:integer;
	BEGIN
		i:=dia_mod;
		writeln('El actual dato correspondiente al dia ',i,' es: ',Pdatos[i]);
		writeln('Escribe el nuevo valor de la variacion: ');
		readln(Pdatos[i]);
	END;{modificacionDato}

FUNCTION subidaMaxima (Pdatos:tDatos):integer;
	VAR
		i,aux,dia:integer;
	BEGIN
		aux:=Pdatos[INI];
		dia:=INI;
		FOR i:=INI TO FIN DO
			IF Pdatos[i]>aux THEN
				BEGIN
					aux:=Pdatos[i];
					dia:=i;
				END;
		subidaMaxima:=dia;
	END;{subidaMaxima}

FUNCTION bajadaMaxima (Pdatos:tDatos):integer;
	VAR
		i,aux,dia:integer;
	BEGIN
		aux:=Pdatos[INI];
		dia:=INI;
		FOR i:=INI TO FIN DO
			IF Pdatos[i]<aux THEN
				BEGIN
					aux:=Pdatos[i];
					dia:=i;
				END;
		bajadaMaxima:=dia;
	END;{bajadaMaxima}

FUNCTION periodoSubida(Pdatos:tDatos):integer;
	VAR
		i,contador,subida:integer;
	BEGIN
		i:=INI;
		contador:=0;
		subida:=0;
		FOR i:=INI TO FIN DO
			BEGIN
			IF Pdatos[i]<=Pdatos[i+1] THEN
				contador:=contador+1
			ELSE
				IF contador>=subida THEN
					BEGIN
						subida:=contador;
						contador:=0;
					END;
			END;
		periodoSubida:=subida;
	END;{periodoSubida}

FUNCTION bajadas(Pdatos:tDatos):boolean;
	VAR
		i:integer;
	BEGIN
		i:=INI;
		WHILE (i<FIN) AND (Pdatos[i]>0) DO
			i:=succ(i);
		bajadas:=(Pdatos[i]>0);
	END;{bajadas}

FUNCTION cambios(Pdatos:tDatos):integer;
	VAR
		i,acum:integer;
	BEGIN
		acum:=0;
		FOR i:=INI TO FIN DO
			BEGIN
				IF (Pdatos[i]<>Pdatos[succ(i)])THEN
					acum:=acum+1;
				i:=i+1;
			END;
		cambios:=acum;
	END;{cambios}

FUNCTION mayorOigual(Pdatos:tDatos):boolean;
	VAR
		i:integer;
	BEGIN
		i:=INI;
		WHILE (i<FIN) AND (Pdatos[i]<Pdatos[succ(i)]) DO
			i:=succ(i);
		mayorOigual:=(Pdatos[i]<Pdatos[succ(i)]);
	END;{mayorOigual}

{##### COMIENZO DEL PROGRAMA PRINCIPAL #####}

BEGIN{Programa Principal}
	REPEAT
		mostrarMenu;
		readln(opcion);
		CASE opcion OF
			OPCION1:BEGIN
						pedirDatos(datos);
					END;
			OPCION2:BEGIN
						mostrarDatos(datos);
					END;
			OPCION3:BEGIN
						writeln('La media es: ',(sumaDatos(datos)/FIN):0:2);
					END;
			OPCION4:BEGIN
						writeln('Subida maxima');
						writeln('Dia de la subida maxima ', subidaMaxima(datos),' la variacion: ',datos[subidaMaxima(datos)]);
					END;
			OPCION5:BEGIN
						writeln('Bajada maxima');
						writeln('Dia de la bajada maxima ', bajadaMaxima(datos),' la variacion: ',datos[bajadaMaxima(datos)]);
					END;
			OPCION6:BEGIN
						writeln('Elij');
						dia:=leerInteger;
						modificacionDato(datos,dia);
						writeln('La lista de variaciones modificada es: ');
						mostrarDatos(datos);
					END;
			OPCION7:BEGIN
						writeln('El período máximo de subida ha sido ',periodoSubida(datos),' dias.');
					END;
			OPCION8:BEGIN
						writeln('“El número de cambios entre días consecutivos han sido ',cambios(datos),' dias.');
					END;
			OPCION9:BEGIN
						writeln('Bajadas');
						IF bajadas(datos) THEN
							writeln('Todo el mes ha tenido bajadas.')
						ELSE
							writeln('Algún día del mes no se ha producido una bajada.');
					END;
			OPCION10:BEGIN
						IF mayorOigual(datos) THEN
							writeln('Ha sido un buen mes. Todas las variaciones han sido mejores que las anteriores.')
						ELSE
							writeln('Algún día del mes no se ha producido una variación mayor o igual que la anterior.');
					END;
			OPCION11:BEGIN
						writeln('Variacion a buscar: ');
						num_buscado:=leerInteger;
						IF buscarDato(datos,num_buscado)<>0 THEN
							writeln('El primer día que se produjo esa variación fue el día ',buscarDato(datos,num_buscado))
						ELSE
							writeln('Esa variación no se producido este mes”.');
					END;
			OPCION12:BEGIN
						writeln('Finalizando... Gracias por usar el programa. Pulse Intro para continuar.');
					END;
		ELSE{CASE}
			writeln('Opcion no valida.');
		END;{CASE}
	UNTIL (opcion=OPCION12);
	readln();
END.{Programa Principal}