%{
	#include<stdio.h>
	extern FILE *yyout;
	extern FILE *yyin;
%}

entero [0-9]
car [a-zA-Z]{1}
cadena [a-z-A-Z0-9]+
real ([0-9])+"."([0-9])+
id ([_]([A-Z]){1}[a-z0-9]+){1,32}
comenlin --[ \ta-zA-Z0-9]+\n
comenmul [<][*][ \t\na-zA-Z0-9]+[*][>]
oparit [+*/%-]
oprela [¿|¡|¡¿|=]
opasig :=
simbol [()}{;,]
espacio [ \t\n]+

%%

si {printf("1");}
entonces {printf("1");}
fin {printf("1");}
sino {printf("1");}
hacer {printf("1");}
mientras {printf("1");}
segun {printf("1");}
escribir {printf("1");}
leer {printf("1");}
terminar {printf("1");}
devolver {printf("1");}
inicio {printf("1");}
estructura {printf("1");}
def {printf("1");}
caso {printf("1");}
sin {printf("1");}
pred: {printf("1");}
{car} {printf("2");}
{entero}+ {printf("3");}
{real} {printf("4");}
{id} {printf("5");}
{comenlin} {printf("6");}
{comenmul} {printf("7");}
{oparit} {printf("8");}
{oprela} {printf("9");}
{opasig} {printf("10");}
{simbol} {printf("11");}
{car}+ {printf("12");}
{espacio} {/*Ignorar los espacios en blanco*/}
. {printf("Ha ocurrido un error lexico: %s\n", yytext);}

%%

int main(int argc , char** argv){
	FILE *f;
	FILE *g;
	if(argc < 2){
		printf("Faltan argumentos\n");
		return -1;
	}
	f = fopen(argv[1], "r");
	if(!f){
		printf("El archivo %s no se puede abrir\n", argv[1]);
		return -1;
	}
	g = fopen("prueba", "w");
	if(!g){
		printf("El archivo %s no se puede abrir\n", argv[1]);
		return -1;
	}
	yyin = f;
	yyout = g;
	fclose(yyin);
	fclose(yyout);
	return 0;
}
