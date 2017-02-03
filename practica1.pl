#!perl
use warnings;
use strict;

=pod

=head1 DESCRIPCION

Este programa declara dos arrays uno numérico y otro vacío, 
se tiene que guardar en el segundo los valores pares del primero
y mostrar el contenido del segundo.

=cut

my @numeros;
my @pares;
my $n;

@numeros = (1..10);
@pares = ();

#for (my $i=0; $i <= 9; $i++) {
#   print "$i\n";
#}

for($n = -1; $n <= $#numeros; $n++){
	if ($n % 2 == 0){
		push(@pares,$n);	
	}
	
}
print @pares, "\n";