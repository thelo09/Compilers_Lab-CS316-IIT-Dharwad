CXX=gcc
CFLAGS=-g -Wall -Werror
FLEX = flex
BISON = bison
compiler: main.c microParser.y microLexer.l
	$(BISON) -d -o microParser.c microParser.y
	$(FLEX)  microLexer.l
	$(CXX) lex.yy.c microParser.c main.c -o $@
dev:
	@echo "Tella Rajashekhar Reddy"
	@echo "200030058@iitdh.ac.in"
clean:
	rm -f lex.yy.c microParser.c microParser.h
