%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

/* ---------- TOKENS ---------- */

%token INT FLOAT BOOL
%token IF ELSE WHILE PRINT

%token TRUE FALSE

%token IDENTIFIER
%token INTEGER

%token ASSIGN

%token PLUS MINUS MULT DIV
%token GT LT

%token LPAREN RPAREN
%token LBRACE RBRACE
%token SEMICOLON

/* ---------- PRECEDENCE ---------- */

%left GT LT
%left PLUS MINUS
%left MULT DIV

%%

program
    : statements
    ;

statements
    : statements statement
    |
    ;

statement
    : declaration
    | assignment
    | print_stmt
    | if_stmt
    | while_stmt
    | block
    ;

block
    : LBRACE statements RBRACE
    ;

declaration
    : INT IDENTIFIER SEMICOLON
    | FLOAT IDENTIFIER SEMICOLON
    | BOOL IDENTIFIER SEMICOLON

    | INT IDENTIFIER ASSIGN expression SEMICOLON
    | FLOAT IDENTIFIER ASSIGN expression SEMICOLON
    | BOOL IDENTIFIER ASSIGN expression SEMICOLON
    ;

assignment
    : IDENTIFIER ASSIGN expression SEMICOLON
    ;

print_stmt
    : PRINT IDENTIFIER SEMICOLON
    ;

if_stmt
    : IF LPAREN expression RPAREN statement
    | IF LPAREN expression RPAREN statement ELSE statement
    ;

while_stmt
    : WHILE LPAREN expression RPAREN statement
    ;

expression
    : INTEGER
    | IDENTIFIER
    | TRUE
    | FALSE

    | LPAREN expression RPAREN

    | expression PLUS expression
    | expression MINUS expression
    | expression MULT expression
    | expression DIV expression

    | expression GT expression
    | expression LT expression
    ;

%%

void yyerror(const char *s)
{
    printf("\nSyntax Error: %s\n", s);
}

int main(void)
{
    printf("=================================\n");
    printf("      Mini Compiler Parser\n");
    printf("=================================\n");
    printf("Parsing started...\n\n");

    if (yyparse() == 0)
    {
        printf("\nParsing completed successfully.\n");
    }

    return 0;
}
