%{
#include<stdio.h>
extern int yylval;
int yylex(void);
void yyerror();
int exponent(int,int);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%left '^'
%right UMINUS
%%
stmt: expr '\n' {printf("result is %d\n",$1);return 0;} ;
expr: expr '^' expr {$$=exponent($1,$3);}| expr '/' expr {$$=$1/$3;}| expr '*' expr {$$=$1*$3;} | expr '+' expr {$$=$1+$3;} | expr '-' expr {$$=$1-$3;} | '-' expr %prec UMINUS {$$=-$2;} | NUM {$$=$1;} ;
%%
int exponent(int m,int n)
{
	int ex=1,i;
	for(i=0;i<n;i++)
	{
		ex = ex*m;
	}
	return ex;
}
int main()
{
	yyparse();
}
void yyerror()
{
}


