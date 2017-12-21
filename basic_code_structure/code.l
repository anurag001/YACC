digit [0-9]
letter [a-zA-Z]
identifier {letter}+|{letter}+{digit}*
datatype int|char|float|long|double|signed|void
%{
#include "y.tab.h"
int countline = 1;
%}
%%
{datatype} {return TYPE;}
{identifier} {return IDEN;}
[,] {return COM;}
[;] {return COL;}
[\n] {countline++;}
[*()] {return *yytext;}
. {;}
%%
int yywrap(void)
{
return 1;
}

