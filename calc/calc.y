%{
#include<stdio.h>
extern int yylval;
int yylex(void);
int exponent(int,int);
void yyerror();
%}
%token NUM
%left '+' '-'
%left '*' '/'
%left '^'
%right UMINUS
%%
stmt: expr '\n' {printf("result is %d\n",$1);return 0;};
expr: expr '^' expr {$$=exponent($1,$3);}|expr '*' expr {$$=$1*$3;}|expr '/' expr {$$=$1/$3;}|expr '+' expr {$$=$1+$3;}|expr '-' expr {$$=$1-$3;}|'-' expr %prec UMINUS {$$=-$2;}|NUM {$$=$1;};
%%
int exponent(int n,int m)
{
	int i,res=1;
	for(i=0;i<m;i++)
	{
		res=res*n;
	}
	return res;
}
int main(void)
{
	printf("Enter Expression\n");
	yyparse();
	return 0;
}
void yyerror()
{
}

