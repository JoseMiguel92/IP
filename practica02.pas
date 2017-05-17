PROGRAM prac2;
	VAR
		n1,n2: real;
		a,b: char;
		c: integer;
	BEGIN
		writeln ('***********************************');
		writeln ('  Autor: Jose Miguel Garcia Benayas');
		writeln ('***********************************');
		writeln (' ');
		writeln (' ');
		writeln ('************** REALES *************');
		writeln ('Introduzca el primer real positivo:');
		readln (n1);
		writeln ('Introduzca el segundo real negativo:');
		readln (n2);
		writeln (n1:10:2,'+':4,n2:8:2,'=':3,n1+n2:8:2);
		writeln (n1:10:2,'-':4,n2:8:2,'=':3,n1-n2:8:2);
		writeln (n1:10:2,'x':4,n2:8:2,'=':3,n1*n2:8:2);
		writeln (n1:10:2,'/':4,n2:8:2,'=':3,n1/n2:8:2);
		writeln ('El valor absoluto de',n2:9:2,' es:',abs(n2):9:2);
		writeln ('El cuadrado de',n1:9:2,' es:',sqr(n1):9:2);
		writeln ('La raiz cuadrada de',n1:9:2,' es:',sqrt(n1):9:2);
		writeln ('El redondeo de',n2:9:2,' es:',round(n2):4);
		writeln ('El truncamiento de',n2:9:2,' es:',trunc(n2):4);
		writeln (' ');
		writeln ('************ CARACTERES ***********');
		writeln ('Introduzca un caracter de la tabla ASCII:');
		readln (a);
		writeln ('Introduzca otro caracter de la tabla ASCII:');
		readln (b);
		writeln ('Introduzca un valor de la tabla ASCII:');
		readln (c);
		writeln ('El ordinal del primer caracter es:',ord(a):4);
		writeln ('El ordinal del segundo caracter es:',ord(b):4);
		writeln ('La diferencia de ordinales entre los dos caracteres es:',ord(a)-ord(b):4);
		writeln ('El sucesor de',a:3,' es:',succ(a):4);
		writeln ('El predecesor de',b:3,' es:',pred(b):4);
		writeln ('El caracter asociado a',c:3,' es:',chr(c):4);
		readln;
END.