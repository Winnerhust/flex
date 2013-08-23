%option noyywrap
%{
        int chars = 0;
        int words = 0;
        int     lines = 0;

        int tochars = 0;
        int towords = 0;
        int tolines = 0;
%}

%%
[^ \t\r\n\v]+ { words++; chars += strlen(yytext);}
\n                        { chars++; lines++;}
.                         { chars++; }

%%

main(int argc, char *argv[])
{
        int i=1;
        for (i=1;i<argc;++i){
                if (!(yyin = fopen(argv[i],"r"))){
                        perror(argv[1]);
                        return 1;
                }
                yylex();

                printf("%8d %8d %8d %s\n",lines,words,chars,argv[i]);

                tochars += chars; chars = 0;
                towords += words; words = 0;
                tolines += lines; lines = 0;
        }
        if (argc>1){
                printf("%8d %8d %8d\n",tolines,towords,tochars);
        }
}
