%{
#include <stdio.h>
%}

%%
"<"[^>]+>   { printf("HTML Tag: %s\n", yytext); }
.         { /* Ignore other characters */ }
%%

int yywrap(){return 1;}
int main() {
    

    FILE* input = fopen("ex.html", "r");
    if (input == NULL) {
        perror("Error opening file");
        return 1;
    }

    yyin = input;
    yylex();

    fclose(input);
    return 0;
}
