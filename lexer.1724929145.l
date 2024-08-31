%{
#include <stdio.h>

int others = 0;
int keyword = 0;
int id = 0;
%}

%%

"int"|"double"|"float"|"char"|"do"|"while"|"main"|"return"|"print"|"scanf"|"include"|"stdio.h" {
    keyword++;
    printf("%s is a keyword\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    id++;
    printf("%s is an identifier\n", yytext);
}

. {
    others++;
}

%%

int main() {
    yyin = fopen("input.c", "r");
    if (!yyin) {
        perror("fopen");
        return 1;
    }

    yylex();

    printf("Number of identifiers: %d\n", id);
    printf("Number of keywords: %d\n", keyword);
    printf("Number of other characters: %d\n", others);

    return 0;
}

int yywrap() {
    return 1;
}

