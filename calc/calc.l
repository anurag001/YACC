%{
#include "y.tab.h"
int yylval;
%}
digit ([0-9]+|[0-9]+\.+[0-9]+)
%%
{digit} {yylval = atoi(yytext);return NUM;}
[+*/^\n-] {return *yytext;}
. {;}
%%
int yywrap(void)
{
	return 1;
}
