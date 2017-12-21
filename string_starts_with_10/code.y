%{
#include<stdio.h>
int yylex (void);     
void yyerror();
%}
%token ONE ZERO NL NML
%% 
str1: str2 nl {} ;
str2: ONE ZERO str3 {} | ONE ZERO {} ;
str3: ZERO str3 nml {} | ONE str3 {} | ONE {} | ZERO {};
nl: NL {printf("string is matched\n");return 1;}; 
nml: NML {printf("string is not matched\n");return 0;}; 
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
