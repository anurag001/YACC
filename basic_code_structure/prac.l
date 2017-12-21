digit [0-9]
letter [a-zA-Z]
datatype long|int|float|char|unsigned|signed|void
identifier {letter}+|{letter}+{digit}*
%{
#include "y.tab.h"
int countline=1;
%}
%%
{datatype} {return TYPE;}
{identifier} {return IDEN;}
[;] {return COL;}
[,] {return COM;}
[\n] {countline++;}
[*()] {return *yytext;}
. {;}
%%
int yywrap(void)
{
return 1;
}

