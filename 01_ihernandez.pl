#!perl
use warnings;
use strict;

 
=pod
 
=head1 DESCRIPCION

Este programa tiene tres variables, dos con valores asignados,
y la tercera se calcula a partir de las otras dos, mostrando
las operaciones básicas que pueden realizarce en Perl.

Tiene otra variable que toma su valor de la entrada estandar,
evalua el valor y muestra en la salida estandar el resultado .

Ejemplo: Calcular el área de un triangulo.
	
		$x = 3; #altura
		$y = 5; #base

		$y*$x/2 #área
 
=cut

print "'Tarea Pragma'\n", "Que es y para que nos sirve\n";
print "Pragma, lo que entendi es que, hacen que al momento de realizar la compilacion, el compilador, 
entienda correctamente todo lo que hemos escrito, ademas de que envie 
algunos avisos en caso de tener indicados algunos.\n";

my $x;
my $y;
my $op;
my $line;
$x=100;
$y=300;

print "Las operaciones básicas con Perl\n\n";

print "Cual es tu nombre: \n\n";

$line = <STDIN>;
chomp $line;

if ($line eq "") {
print "Esta bien no me digas tu nombre.\n\n\n";
} else {
print "\nBienvenido al curso de Perl $line!\n\n\n";
}

#Operaciones con Perl
print "Suma\t", "Resta\t", "Multiplicacion\t\t", "Division\t\t", "Modulo\n";
#Suma
$op = $x + $y;
print $op, "\t";
#resta
$op = $y - $x;
print $op, "\t";
#multiplicacion
$op = $x * $y;
print $op, "\t\t\t";
#division
$op = $x / $y;
print $op, "\t";
#modulo
$op = $x % $y;
print $op,"\n";

#Tipos de datos
#Arreglos




