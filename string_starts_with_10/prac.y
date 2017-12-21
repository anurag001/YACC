%{
#include<stdio.h>
int yylex (void);     
void yyerror();
%}
%token ONE ZERO NL
%% 
str1: str2 nl {} ;
str2: ONE ZERO str3 {} | ONE ZERO {} ;
str3: ZERO str3 nml {} | ONE str3 {} | ONE {} | ZERO {};
nl: NL {printf("string is matched\n");}; 
nml: NL {printf("string is not matched\n");}; 
%%
int yywrap()
{
	return 1;	
}

int main()
{

yyparse();
return 0;

}
void yyerror()
{
}
