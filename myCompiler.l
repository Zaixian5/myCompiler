%{
#include <string.h>
#include "myCompiler.h"
#define MAXSYM	100
#define	MAXSYMLEN	20
char symtbl[MAXSYM][MAXSYMLEN];
int lineno=1;
int insertsym();
int maxsym=0;
char s[MAXSYMLEN];
int temp;

%}
sp		[ \t]
ws		{sp}+
nl		\n
eletter	[A-Za-z]
hletter	[\xb0-\xfe][\xa0-\xfe]
letter	({eletter}|{hletter})
digit	[0-9]
id		{letter}({letter}|{digit})*
%%
{ws}	        {/* do nothing */}
{nl}	        {lineno++; }
plus	        {return(ADD); }
minus		    {return(SUB); }
times           {return(MUL); }
divided[ \t]by  {return(DIV); }
is		        {return(ASSGN); }
\.		        {return(STMTEND); }
begin		    {return(START); }
finish		    {return(END); }
{id}	        {temp=insertsym(yytext); yylval=MakeNode(ID, temp); return(ID);} 
{digit}+		{sscanf(yytext, "%d", &temp); yylval=MakeNode(NUM, temp); return(NUM);} 
.		        {printf("invalid token %s\n", yytext); }
%%

int insertsym(char * s)
{
    int i;

	for(i=0;i<maxsym; i++) {
		if(strcmp(s, symtbl[i])==0) return(i);
	}
	if (i<MAXSYM-1) {
		strcpy(symtbl[maxsym],s);
		maxsym++;
		return(maxsym-1);
	}
	else{
        printf("symbol table overflow\n");
    }

	return(0);
}

yywrap() {}