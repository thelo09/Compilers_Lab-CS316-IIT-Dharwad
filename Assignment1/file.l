%{

%}
PROGRAM "PROGRAM"
BEGIN "BEGIN"
END "END"
FUNCTION "FUNCTION"
READ "READ"
WRITE "WRITE"
IF "IF"
ELSE "ELSE"
ENDIF "ENDIF"
WHILE "WHILE"
ENDWHILE "ENDWHILE"
BREAK "BREAK"
CONTINUE "CONTINUE"
RETURN "RETURN"
INT "INT"
VOID "VOID" 
STRING "STRING"
FLOAT "FLOAT"
ASSIGN ":="
ADD "+"
SUB "-"
MUL "*"
DIV "/"
EQUAL "=" 
NOTEQUAL "!="
LESSTHAN "<"
GREATERTHAN ">"
LEFT "("
RIGHT ")"
SEMICOLON ";"
COMMA ","
LTE "<="
GTE ">="
DIGIT [0-9]
ID [a-zA-Z][a-z0-9A-Z]*
%%
{PROGRAM}|{BEGIN}|{END}|{FUNCTION}|{READ}|{WRITE}|{IF}|{ELSE}|{ENDIF}|{WHILE}|{ENDWHILE}|{BREAK}|{CONTINUE}|{RETURN}|{INT}|{VOID}|{STRING}|{FLOAT}|{WRITE} {fprintf(yyout,"Token Type: KEYWORD\nValue: %s\n",yytext);}
{ASSIGN}|{ADD}|{SUB}|{MUL}|{DIV}|{EQUAL}|{NOTEQUAL}|{LESSTHAN}|{GREATERTHAN}|{LEFT}|{RIGHT}|{SEMICOLON}|{COMMA}|{LTE}|{GTE} {fprintf(yyout,"Token Type: OPERATOR\nValue: %s\n",yytext);}
[ \n\t]+ {}
"//".*\n {}
{DIGIT}+ {fprintf(yyout,"Token Type: INTLITERAL\nValue: %s\n",yytext);}
{DIGIT}+"."{DIGIT}* {fprintf(yyout,"Token Type: FLOATLITERAL\nValue: %s\n",yytext);}
{ID}* {fprintf(yyout,"Token Type: IDENTIFIER\nValue: %s\n",yytext);}
\"(\\.|[^"\\])*\" {fprintf(yyout,"Token Type: STRINGLITERAL\nValue: %s\n",yytext);}
. {}

%%

/*** Code Section prints the number of
capital letter present in the given input***/
int yywrap(){}
int main(int argc, char** argv){
FILE *fr,*fw;
fr = fopen(argv[1],"r");
yyin = fr;
fw = fopen(argv[2],"w");
yyout = fw;
yylex();
return 0;
}
