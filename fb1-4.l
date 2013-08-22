%{
	enum yytokentype{
		NUMBER =258,
		ADD,
		SUB,
		MUL,
		DIV,
		ABS,
		EOL
	};
	int yylval;
%}

%%
"+" {printf("PLUS\n"); }
"-" {printf("MINUS\n"); }
"*" {printf("TIMES\n"); }
"/" {printf("DIV\n"); }
"|" {printf("ABS\n"); }
"[0-9]+" {printf("NUMBER %s\n",yytext); }
"\n" {printf("NEWLINE\n"); }
"[\t]" { }
"." { }
%%

int main(int argc, char * argv[])
{
	int tok;

	while(tok == yylex()){
		printf ("%d",tok);
		if(tok == NUMBER)
			printf(" = %d\n",yylval);
		else 
			printf("\n");
	}
	return 0;
}
