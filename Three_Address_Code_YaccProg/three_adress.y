%{
#include<stdio.h>
#define YYSTYPE char*
extern FILE* yyin;
int lineCount=1;

int yylex (void);     
void yyerror();
%}

%token IDEN NVAL
%left '+' '-'
%left '*' '/'

%% 
stmt1st: |stmt1st assExpr ';' {printf("\t quadruple %d\n",lineCount);
	} | stmt1st error;
assExpr:  IDEN '=' expr {printf("\t%s\t=\t%s\t",$1,$3);};
expr: expr '+' expr {$$=getTempId();printf("%s\t=\t%s + \t%s\n",$$,$1,$3);}
|expr '-' expr {$$=getTempId();printf("%s\t=\t%s - \t%s\n",$$,$1,$3);}
|expr '*' expr {$$=getTempId();printf("%s\t=\t%s * \t%s\n",$$,$1,$3);}
|expr '/' expr {$$=getTempId();printf("%s\t=\t%s / \t%s\n",$$,$1,$3);}
|'('expr')' { $$=$2;}
|IDEN { $$=$1;}
|NVAL { $$=$1;}
;
	
	 
%%
void yyerror()
{
}

getTempId()
{
	static tmpCount=0;
	char tmp[5];
	sprintf(tmp,"\t%d",tmpCount++);
	return(strdup(tmp));
}

main()
{
char filename[20];
printf("Enter the name:\t");
scanf("%s",filename);
yyin=fopen(filename,"r+");
yyparse();

}

