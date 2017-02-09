#!/usr/bin/perl
#use strict;
#use warnings;
#use Net::Ifconfig::Wrapper;
#use Data::Validate::IP;


=pod

Programa que escribe datos en un template HTML, que se obtienen de dos 
subrutinas. 

=cut







use HTML::Template;
open FH,'>',"prueba.html" or die "Error";
	print FH &showData();
close FH;

#print &showData();

sub showData{
		my $output;
		my $template = HTML::Template->new(filename => 'template.tmpl');
		my $contenido=&datos_passwd;
		my @loop_data=();
		while(@{$contenido->[0]}){
				my %row_data;
				$row_data{user}=shift @{$contenido->[0]};
				$row_data{pass}=shift @{$contenido->[1]};
				$row_data{uid}=shift @{$contenido->[2]};
				$row_data{gid}=shift @{$contenido->[3]};
				$row_data{geeko}=shift @{$contenido->[4]};
				$row_data{home}=shift @{$contenido->[5]};
				$row_data{shell}=shift @{$contenido->[6]};
				push(@loop_data,\%row_data);
	
		}
		$template->param(datos_tarea => \@loop_data);
		$output.=$template->output();
		#print $output,"\n";
		return $output;
}



sub datos_passwd {
			
			my %hash;
			my @user=();
			my @pass=();
			my @uid=();
			my @gid=();
			my @geeko=();
			my @home=();
			my @shell=();
			my $filename = "datos.txt";
			open FILE, "<",$filename;
			my @file=(<FILE>);
			for(@file){
				if(/(.*):(.*):(.*):(.*):(.*):(.*):(.*)/){
				
					push(@user,$1);
					push(@pass,$2);
					push(@uid,$3);
					push(@gid,$4);
					push(@geeko,$5);
					push(@home,$6);
					my($hom,$us)=(split '/',$7)[0,1];
					push(@shell,$hom);
					}
			
			}
			close FILE;
			my @datos=(\@user,\@pass,\@uid,\@gid,\@geeko,\@home,\@shell);
			return \@datos;

}

