%{
#include<stdio.h>
int yylex (void);     
void yyerror();
%}
%token MOR NL NIG
%% 
msg: MOR {char name[20];
printf("Hello,enter name:");
scanf("%s",name);
printf("\nMorning\t%s",name);
}
;
msg: NIG {char name1[20];
printf("Hello,enter name:");
scanf("%s",name1);
printf("\nNight\t%s",name1);
}
;
msg: NL {printf("end of program");
return 0;}
;
%%
int yywrap(void)
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

