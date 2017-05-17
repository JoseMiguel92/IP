PROGRAM prac10;
CONST
	MIN=1;
	MAX=150;
	OPCION1=1;
	OPCION2=2;
	OPCION3=3;
	OPCION4=4;
	OPCION5=5;
	OPCION6=6;
TYPE
	tRPedido=RECORD
		primero:string;
		segundo:string;
		bebida:string;
		precio:real;
	END;
	tRango=MIN..MAX;
	tPedidos=ARRAY[tRango]OF tRPedido;
	tRPedidosActuales=RECORD
		pedidos:tPedidos;
		tope:integer;
	END;
VAR
	datos_pedido:tRPedidosActuales;
	tope,pos_vip,opcion:integer;
	p1,p2:string;

PROCEDURE mostrarMenu;
BEGIN{mostrarMenu}
	writeln();
	writeln('**********************************');
	writeln(' Autor: Jose Miguel Garcia Benayas');
	writeln('**********************************');
	writeln();
	writeln(OPCION1,') Tomar nota de un pedido.');
	writeln(OPCION2,') Alta en posicion intermedia.');
	writeln(OPCION3,') Servir pedido.');
	writeln(OPCION4,') Mostrar pedidos.');
	writeln(OPCION5,') Buscar pedido.');
	writeln(OPCION6,') Finalizar.');
END;{mostrar Menu}

PROCEDURE tomar_nota (VAR nota:tRPedidosActuales);{Utilizamos referencia por motivos de eficiencia}
	VAR
		nuevo_pedido:tRPedido;
	BEGIN
		WITH nuevo_pedido DO BEGIN
			writeln('Introduce el primer plato.');
			readln(primero);
			writeln('Introduce el segundo plato.');
			readln(segundo);
			writeln('Introduce la bebida.');
			readln(bebida);
			REPEAT
				writeln('Introduce el precio.');
				readln(precio);
			UNTIL (precio >=0);
		END;{WITH}
		WITH nota DO BEGIN
			IF tope<MAX THEN
				BEGIN
					tope:=tope+1;
					pedidos[tope]:=nuevo_pedido;
				END
			ELSE
				writeln('Pedidos llenos.');
		END;{WITH}
END;{TOMAR NOTA}

PROCEDURE tomar_nota_vip (VAR nota:tRPedidosActuales; posicion:integer);{Utilizamos referencia por motivos de eficiencia}
	VAR
		nuevo_pedido:tRPedido;
	BEGIN
		WITH nuevo_pedido DO BEGIN
			writeln('Introduce el primer plato.');
			readln(primero);
			writeln('Introduce el segundo plato.');
			readln(segundo);
			writeln('Introduce la bebida.');
			readln(bebida);
			REPEAT
				writeln('Introduce el precio.');
				readln(precio);
			UNTIL (precio >=0);
		END;{WITH}
		nota.pedidos[posicion]:=nuevo_pedido;
END;{TOMAR NOTA VIP}

PROCEDURE mostrar_pedido (VAR nota:tRPedidosActuales ; numero_pedido:integer);{Utilizamos referencia por motivos de eficiencia}
	BEGIN
		WITH nota.pedidos[numero_pedido] DO BEGIN
			writeln;
			writeln('Numero de pedido: ',numero_pedido,'.');
			writeln('  Primer plato: ',primero,'.');
			writeln('  Segundo plato: ',segundo,'.');
			writeln('  Bebida: ',bebida,'.');
			writeln('  Precio: ',precio:0:2,' euros.');
			writeln;
		END;{WITH}
END;{MOSTRAR UN PEDIDO}

PROCEDURE precios_max_min (VAR nota:tRPedidosActuales;VAR mayor,menor:real);{Utilizamos referencia por motivos de eficiencia}
	VAR
		i:integer;
		aux1,aux2:real;
	BEGIN
		WITH nota DO BEGIN
			aux1:=pedidos[MIN].precio;
			aux2:=pedidos[MIN].precio;
			FOR i:=MIN TO tope DO BEGIN
				IF (pedidos[i].precio>aux1) THEN
					aux1:=pedidos[i].precio;
				IF (pedidos[i].precio<aux2) THEN
					aux2:=pedidos[i].precio;
			END;
		END;{WITH}
	mayor:=aux1;
	menor:=aux2;
END;{PRECIOS MAXIMO Y MINIMO}

PROCEDURE mostrar_todos_pedidos (VAR nota:tRPedidosActuales);{Utilizamos referencia por motivos de eficiencia}
	VAR
		i:integer;
		mayor,menor:real;
	BEGIN
		mayor:=0;
		menor:=0;
		WITH nota DO BEGIN
			FOR i:=MIN TO tope DO
				BEGIN
					mostrar_pedido(nota,i);
				END;{FOR}
			IF (tope=1) THEN
				writeln('Queda ',tope,' pedido por servir.')
			ELSE
				writeln('Quedan ',tope,' pedidos por servir.');
		END;{WITH}
	precios_max_min(nota,mayor,menor);
	writeln('El precio mas alto es: ',mayor:0:2,' euros.');
	writeln('El precio mas bajo es: ',menor:0:2,' euros.');
END;{MOSTRAR TODOS LOS PEDIDOS}

PROCEDURE servir_pedido (VAR nota:tRPedidosActuales);{Utilizamos referencia por motivos de eficiencia}
	VAR
		i:integer;
		servir:char;
	BEGIN
		WITH nota DO BEGIN
		IF tope<=0 THEN
				writeln('Ya se han servido todos los pedidos.')
		ELSE BEGIN
			mostrar_pedido(nota,1);
			writeln('¿Se ha servido el primer pedido?');
			REPEAT
			writeln('Si=s , No=n');
			readln(servir);
			UNTIL (servir='s') OR (servir='n');
			IF  (servir='s')THEN BEGIN
					FOR i:=1 TO tope DO
						pedidos[i]:=pedidos[i+1];
					tope:=tope-1;
					writeln('Pedido Servido.');
				END;{WITH}
			END;{IF}
		END;{ELSE}
END;{SERVIR PEDIDO}

FUNCTION buscar_pedido(nota:tRPedidosActuales ; plato1,plato2:string):integer;
VAR
	encontrado:boolean;
	i:integer;
BEGIN;
	i:=0;
	encontrado:=FALSE;
	WITH nota DO BEGIN
		WHILE (NOT encontrado) AND (i<=tope) DO BEGIN
				IF (pedidos[i].primero=plato1) AND (pedidos[i].segundo=plato2) THEN
					encontrado:=TRUE
				ELSE
					i:=i+1;
		END;{WHILE}
	END;{WITH}
	IF encontrado THEN
		buscar_pedido:=i
	ELSE
		buscar_pedido:=0;
END;{BUSCAR PEDIDO}

PROCEDURE vip (VAR nota:tRPedidosActuales;posicion_vip:integer);{Utilizamos referencia por motivos de eficiencia}
	VAR
		i:integer;
	BEGIN
		WITH nota DO BEGIN
		IF (tope<MAX) THEN BEGIN
			tope:=tope+1;
				FOR i:=tope-1 DOWNTO posicion_vip DO
					pedidos[i+1]:=pedidos[i];
			END;{WITH}
			tomar_nota_vip(nota,posicion_vip);
		END;
END;{VIP}



BEGIN{PROGRAMA PRINCIPAL}
	tope:=0;
	REPEAT
		mostrarMenu;
		readln(opcion);
		CASE opcion OF
			OPCION1:BEGIN
						tomar_nota (datos_pedido);
					END;
			OPCION2:BEGIN
						writeln('Introduce la posicion del cliente:');
						readln(pos_vip);
						vip(datos_pedido,pos_vip);
					END;
			OPCION3:BEGIN
						servir_pedido(datos_pedido);
					END;
			OPCION4:BEGIN
						mostrar_todos_pedidos(datos_pedido);
					END;
			OPCION5:BEGIN
						writeln('Introduzca el primer plato conocido.');
						readln(p1);
						writeln('Introduzca el segundo plato conocido.');
						readln(p2);
						IF (buscar_pedido(datos_pedido,p1,p2)<>0) THEN
							writeln('El pedido es el numero ',buscar_pedido(datos_pedido,p1,p2))
						ELSE
							writeln('Pedido no encontrado.');
					END;
			OPCION6:BEGIN
						writeln('Finalizando... Gracias por usar el programa. Pulse Intro para continuar.');
					END;
		ELSE{CASE}
			writeln('Opcion no valida.');
		END;{CASE}
	UNTIL (opcion=OPCION6);
	readln();
END.