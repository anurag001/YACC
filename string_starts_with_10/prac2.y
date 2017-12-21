%{
#include<stdio.h>
int yylex(void);
void yyerror();
%}
%token ONE
%token ZERO
%token NL
%%
st1: st2 nl {};
st2: ONE ZERO st3 {}| ONE ZERO {};
st3: ZERO st3 {}| ONE st3 {}| ZERO {}| ONE {};
nl: {printf("String is matched\n");};
%%
int main()
{
yyparse();
}
void yyerror()
{
}
