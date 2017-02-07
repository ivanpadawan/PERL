#!perl
use warnings;
use strict;
use v5.10;

=pod

	Programa que recibe un archivo de datos.

	En este caso divide lel archivo en tres categorias
	segun las expresiones regulares empleadas (ip,url,correo),
	las cuales va almacenar y posteriormente ordenarlas dependiendo
	del numero de veces que se encuentren.
	Al final los resultados los escribira a un archivo.

=cut


#encuentra los patrones segun las expresiones regulares

my @ip;
my @url;
my @email;
my %datos=("ips"=>\@ip,"url"=>\@url,"emails"=>\@email);

print "Ingresa el nombre del archivo: "; 
# my $archivo =<STDIN>;

#chomp;
open(FCG,'<',$ARGV[0])
  or die "Holy shit something happend!!";
 
while (<FCG>) {
  chomp;
  if(/(((([0-9]+[a-z]+)+)@(.*[.]+)))/){ 
  		push(@email, $1);
		}
	elsif(/(((\d){1,3}[.]){3}(\d){1,3})/){ 
  		push(@ip, $1);
		}
    elsif(/((https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \?=.-]*)*\/?)/){ 
  		push(@url, $1);
		}

 }
  
close(FCG);

#Cuenta las veces que se encuentra cada patron

	my %count;
	my %count1;
	my %count2;
	my $url;
	my $email;		
	my $ip;
	
	foreach $ip (@ip) {
			$count{$ip} += 1; # cuenta las ip.
}
	foreach $url (@url) {
			$count1{$url} += 1; # cuenta las url
}
	foreach $email (@email) {
			$count2{$email} += 1; # cuenta los correos
}


# Escribe los resultados a un archivo
my $salida = 'final.txt';
			 open(FH, '>>', $salida) or die "ERROR ERROR ERROR";
					
					print FH "Las IP encontradas son: \n";
					print FH "TOTAL " . "   IP\n";
					
					
				foreach $ip (sort {$count{$a} <= $count{$b}}  keys %count) { 
			    }


			    	print FH "Las URL encontradas son: \n";
			    	print FH "TOTAL " . "   URL\n";
					
					
				foreach $url (sort {$count1{$a} <= $count1{$b}}  keys %count1) { 
							print FH "$count1{$url} |  $url\n";
			    }


			    	print FH "Los CORREOS encontrados son: \n";
			    	print FH "TOTAL " . "   CORREO\n";
					
					
				foreach $email (sort {$count2{$a} <= $count2{$b}}  keys %count2) { 
							print FH "$count2{$email} |  $email\n";
			    }
			




			close FH;




    
