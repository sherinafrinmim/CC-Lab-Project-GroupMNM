#ifndef TOKENS_H
#define TOKENS_H

typedef enum {

    /* Keywords */
    T_INT,
    T_FLOAT,
    T_BOOL,
    T_IF,
    T_ELSE,
    T_WHILE,
    T_PRINT,
    T_TRUE,
    T_FALSE,

    /* Identifier */
    T_IDENTIFIER,

    /* Literals */
    T_INTEGER,
    T_FLOAT_LITERAL,

    /* Arithmetic Operators */
    T_PLUS,
    T_MINUS,
    T_MULTIPLY,
    T_DIVIDE,
    T_MOD,

    /* Assignment */
    T_ASSIGN,

    /* Relational Operators */
    T_LT,
    T_GT,
    T_LE,
    T_GE,
    T_EQ,
    T_NE,

    /* Logical Operators */
    T_AND,
    T_OR,
    T_NOT,

    /* Delimiters */
    T_SEMICOLON,
    T_COMMA,
    T_LPAREN,
    T_RPAREN,
    T_LBRACE,
    T_RBRACE

} TokenType;

#endif
