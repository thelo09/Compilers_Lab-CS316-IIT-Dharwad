NAME = Tella Rajashekhar Reddy
EMAIL = 200030058@iitdh.ac.in

compiler: 
	bison -d microParser.ypp
	flex microLexer.l
	@g++ -g main.cpp microParser.tab.cpp lex.yy.c -o compiler
clean:
	@rm -f lex.yy.c* *.tab.* compiler test.out

dev:
	@echo $(NAME)
	@echo $(EMAIL)
