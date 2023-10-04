%{
#include "microParser.h"
%}
ASSIGN ":"
ADD "+"
SUB "-"
MUL "*"
DIV "/"
EQUAL "=" 
NOTEQUAL "!"
LESSTHAN "<"
GREATERTHAN ">"
LEFT "("
RIGHT ")"
SEMICOLON ";"
COMMA ","
DIGIT [0-9]
ID [a-zA-Z][a-z0-9A-Z]*
%%
PROGRAM {
	return PROGRAM;
}
BEGIN {
	return _BEGIN;
}
END {
	return END;
}
FUNCTION {
	return FUNCTION;
}
READ {
	return READ;
}
WRITE {
	return WRITE;
}
IF {
	return IF;
}
ELSE {
	return ELSE;
}
ENDIF {
	return ENDIF;
}
WHILE {
	return WHILE;
}
ENDWHILE {
	return ENDWHILE;
}
BREAK {
	return BREAK;
}
CONTINUE {
	return CONTINUE;
}
RETURN {
	return RETURN;
}
INT {
	return INT;
}
VOID {
	return VOID;
}
STRING {
	return STRING;
}
FLOAT {
	return FLOAT;
}
WRITE {
	return WRITE;
}
{ASSIGN}|{ADD}|{SUB}|{MUL}|{DIV}|{EQUAL}|{NOTEQUAL}|{LESSTHAN}|{GREATERTHAN}|{LEFT}|{RIGHT}|{SEMICOLON}|{COMMA} {
	return *yytext;
}
[ \n\t]+ {}
"//".*\n {}
{DIGIT}+ {
	return INTLITERAL;
}
{DIGIT}+"."{DIGIT}* {
	return FLOATLITERAL;
}
{ID}* {
	return IDENTIFIER;
}
\"(\\.|[^"\\])*\" {
	return STRINGLITERAL;
	}
. {}

%%
int yywrap(){
return 1;}
