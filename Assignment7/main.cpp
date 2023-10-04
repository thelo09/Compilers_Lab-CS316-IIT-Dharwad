#include<iostream>
#include<cstdio>
#include<vector>
#include "microParser.tab.hpp"

int yyparse();
int yylex(); 
extern FILE* yyin;

// yerror function
void yyerror(const char *s){
 // printf("");
}

// main function
int main(int argc, char* argv[]){
	if(argc > 1){
		FILE *filep = fopen(argv[1], "r");
		if(filep)
			yyin = filep;
	}
	
    if (yyparse() == 0);
       // printf("");
}
