all:
	flex fb1-1.l
	cc lex.yy.c -o fb1-1 -lfl
