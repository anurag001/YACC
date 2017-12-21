%{
#include<stdio.h>
extern int countline;
extern FILE *yyin;
int cid=0;
int yylex(void);
void yyerror();
void display();
%}
%token IDEN COM COL TYPE
%%
st1: |st1 varDec {}|st1 funcDec {}|st1 error {};
varDec: TYPE st {printf("No: of variables in line %d is %d\n",countline,cid);cid=0;};
st:IDEN COM st {cid++;}|IDEN COL {cid++;};
funcDec: TYPE IDEN '(' st2 ')' COL { display();} | TYPE IDEN '(' st3 ')' COL { display();};
st2: TYPE IDEN COM st2 {}|TYPE IDEN {};
st3: TYPE COM st3 {}|TYPE {};
%%
void display()
{
	printf("function is in line number %d\n",countline);
}
int main(int argc,char *argv[])
{
	yyin=fopen(argv[1],"r");
	yyparse();
	return 0;
}
void yyerror()
{
}

