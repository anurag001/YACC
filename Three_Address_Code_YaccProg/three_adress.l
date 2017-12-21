%{
#include "y.tab.h"
#include<string.h>

extern char* yylval;
extern int lineCount;


%}
digit [0-9]
letter [a-zA-Z]
num {digit}+(\.{digit}+)?
name {letter}({letter}|{digit})*
%% 

{name} {yylval=strdup(yytext); return IDEN;}
{num} {yylval=strdup(yytext); return NVAL;}
[=*/+\-();] {return *yytext;}

[\n] {lineCount++;}
[\t] ;
. ;
%%
int yywrap()
{
return 1;
}


