%{
        long chars = 0;
        long words = 0;
        long lines = 0;
%}
%%
[^ \t\n\rf\v ]+ { words++; chars += strlen(yytext); }
\n                              { chars++; lines++; }
.                               { chars++;}
%%

main(int argc, char *argv[])
{
        yylex();
        printf("lines=%ld words=%ld chars=%ld\n",lines,words,chars);
}
