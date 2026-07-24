%option noyywrap

%{
#include <stdio.h>
#include "../parser/parser.tab.h"
%}

DIGIT      [0-9]
LETTER     [a-zA-Z_]
ID         {LETTER}({LETTER}|{DIGIT})*
INT        {DIGIT}+

%%

"int"      { return INT; }
"float"    { return FLOAT; }
"bool"     { return BOOL; }

"if"       { return IF; }
"else"     { return ELSE; }
"while"    { return WHILE; }
"print"    { return PRINT; }

"true"     { return TRUE; }
"false"    { return FALSE; }

";"        { return SEMICOLON; }
"="        { return ASSIGN; }

"("        { return LPAREN; }
")"        { return RPAREN; }

"{"        { return LBRACE; }
"}"        { return RBRACE; }

"+"        { return PLUS; }
"-"        { return MINUS; }
"*"        { return MULT; }
"/"        { return DIV; }

">"        { return GT; }
"<"        { return LT; }

{INT}      { return INTEGER; }

{ID}       { return IDENTIFIER; }

[ \t\r\n]+ ;

"//".*     ;

.          { printf("Unknown character: %s\n", yytext); }

%%
