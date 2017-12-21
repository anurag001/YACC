Digit [0-9]
Letter [a-zA-Z]
DataType int|char|float|long|double|signed|void
Ident {Letter}({Letter}|{Digit})*
%{
#include "y.tab.h"
int countline=1;

%}
%% 
{DataType} {return TYPE;}
{Ident} {return IDEN;}
[;] {return COLE;}
[,] {return COMMA;}
[\n] {countline++;}
[*()] {return *yytext;}
. {;} 
%%
int yywrap()
{
return 1;
}

