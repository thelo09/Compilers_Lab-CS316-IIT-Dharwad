%{
#include<iostream>
#include<cstring>
#include "microParser.tab.hpp"
int line = 5;
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
	
	yylval.chrval = "INT";
	return INT;
	// return INT;
}
VOID {
	// return VOID;
	yylval.chrval = "VOID";
	return VOID;
}
STRING {
	return STRING;
}
FLOAT {
	yylval.chrval = "FLOAT";
	return FLOAT;
}
{ASSIGN}|{ADD}|{SUB}|{MUL}|{DIV}|{EQUAL}|{NOTEQUAL}|{LESSTHAN}|{GREATERTHAN}|{LEFT}|{RIGHT}|{SEMICOLON}|{COMMA} {
	yylval.strval = strdup(yytext);
	return *yytext;
}
[ \n\t]+ {}
"//".*\n {line++;}
{DIGIT}+ {
	yylval.strval = strdup(yytext);
	return INTLITERAL;
}
{DIGIT}+"."{DIGIT}* {
	yylval.strval = strdup(yytext);
	return FLOATLITERAL;
}
{ID}* {
	yylval.mypair = new std::pair<std::string,int>;
	(yylval.mypair)->first  = std::string(yytext);
	(yylval.mypair)->second = line;
	return IDENTIFIER;
}
\"(\\.|[^"\\])*\" {
	yylval.mypair = new std::pair<std::string,int>;
	(yylval.mypair)->first  = std::string(yytext);
	(yylval.mypair)->second = line;
	return STRINGLITERAL;
	}
. {}

%%
int yywrap(){
return 1;}
