%{
#include<stdio.h>
extern FILE *yyin;
extern int countline;
int countid=0;
int yylex (void);     
void yyerror();
void display();
%}
%token TYPE IDEN COMMA COLE
%% 
stmt1: | stmt1 varDec {} | stmt1 funcDec {} | stmt1 error {};
varDec: TYPE stmt2 {printf("No: of variables in line %d is %d\n",countline,countid);countid=0;};
stmt2: IDEN COMMA stmt2 {countid++;} | IDEN COLE {countid++;};
funcDec: TYPE IDEN '(' stmt3 ')' COLE { display();} | TYPE IDEN '(' stmt5 ')' COLE { display();};
stmt3: TYPE IDEN stmt4 {} | TYPE '*' IDEN stmt4 {} | TYPE stmt3 {};
stmt4: COMMA stmt3 {} | stmt6 ;
stmt5: TYPE COMMA stmt5 {} | TYPE stmt5 {} | stmt6;
stmt6: ;  
%%
int main(int argc,char* argv[])
{
yyin=fopen(argv[1],"r+");
yyparse();
return 0;
}
void display()
{
printf("function is in line number %d\n",countline);
}
void yyerror()
{
}

