%{
#include<stdio.h>
int yylex(void);
void yyerror();
void display();
extern int countline;
extern FILE *yyin;
int countid=0;
%}
%token IDEN
%token TYPE
%token COM
%token COL
%%
st1: | st1 varDec {} | st1 funcDec {} | st1 error {} ;
varDec: TYPE st2 {printf("No of var in line %d is %d\n",countline,countid);countid=0;};
st2: IDEN COM st2 {countid++;}|IDEN COL {countid++;};
funcDec: TYPE IDEN '(' st3 ')' COL {display();}|TYPE IDEN '(' st5 ')' COL {display();};
st3: TYPE IDEN COM st3 {}|TYPE IDEN {};
st5: TYPE COM st5 {}| TYPE {};
%%
int main(int argc,char *argv[])
{
	yyin = fopen(argv[1],"r");
	yyparse();
}
void display()
{
	printf("function is in line no %d\n",countline);
}
void yyerror()
{
}
