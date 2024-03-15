%{
#include <stdio.h>
%}

DIGIT [0-9]
NON_ZERO_DIGIT [1-9]
NUMBER ({DIGIT}+|{NON_ZERO_DIGIT}{DIGIT}*)
%%
{NUMBER} {
    printf("Number found: %s\n", yytext);
}
.|\n {
    // Ignore all other characters
}
%%
int yywrap(){return 1;}
int main() {
   
    FILE* input = fopen("file.txt", "r");
    if (input == NULL) {
        perror("Error opening file");
        return 1;
    }

    yyin = input;
    yylex();

    fclose(input);
    return 0;
}
