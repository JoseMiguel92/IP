PROGRAM practica1;
	VAR
		a,b : INTEGER;
	BEGIN
		writeln ('Introduzca el primer numero: ');
		readln (a);
		writeln ('Introduzca el segundo numero: ');
		readln (b);
		writeln ('**********************************');
		writeln (' Autor: Jose Miguel Garcia Benayas');
		writeln ('**********************************');
		writeln ('   ',a, ' + ', b, ' = ', a+b);
		writeln ('   ',a, ' - ', b, ' = ', a-b);
		writeln ('   ',a, ' x ', b, ' = ', a*b);
		writeln ('   ',a, ' / ', b, ' = ', a DIV b);
		writeln ('El resto de la division es: ', a MOD b);
		writeln ('El valor absoluto del primer numero es: ', abs (a));
		writeln ('El cuadrado del primer numero es: ', sqr (a));
		writeln ('El sucesor del primer numero es: ', succ (a));
		writeln ('El antecesor del primer numero es: ', pred (a));
		readln;
	END.