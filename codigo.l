%{
#include <stdio.h>
int inComment = 0;  
%}

%%
^#.*             
^\/\/.*          
"/*"             { inComment = 1; }  
.|\n             {
                    if (!inComment) {
                        printf("%s", yytext);
                    }
                    if (yytext[strlen(yytext) - 1] == '\n') {
                        inComment = 0;  
                    }
                }
"*/"             { inComment = 0; }  
%%

int main() {
    yylex();
    return 0;
}
