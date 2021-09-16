type token =
  | EOF
  | BLOCK_1_1 of (char)
  | EXPR1_10_1 of (char)
  | EXPR1_12_1 of (char)
  | EXPR1_14_1 of (char)
  | EXPR1_19_1 of (char)
  | EXPR1_19_3 of (char)
  | EXPR1_21_1 of (char)
  | EXPR1_22_1 of (char)
  | EXPR1_6_0 of (char)
  | EXPR1_7_1 of (char)
  | EXPR1_8_1 of (char)
  | EXPR1_9_1 of (char)
  | IDENT_LIST_1_1_0_0_0 of (char)
  | IDENTS_0_0 of (char)
  | IDENTS_0_2 of (char)
  | LAMBDA1_0_4 of (char)
  | LAMBDA1_0_5 of (char)
  | LAMBDA1_0_7 of (char)
  | STMT_2_1 of (char)
  | NUMBER of (float)
  | EXPR1_11_1 of (string)
  | EXPR1_13_1 of (string)
  | EXPR1_15_1 of (string)
  | EXPR1_16_1 of (string)
  | EXPR1_17_1 of (string)
  | EXPR1_18_1 of (string)
  | EXPR1_20_0 of (string)
  | EXPR1_20_2 of (string)
  | IDENT1 of (string)
  | SEXP2_1_1 of (string)
  | SEXP2_2_1 of (string)
  | SEXP2_3_1 of (string)
  | START_1_0 of (string)
  | START_2_0 of (string)
  | STRING of (string)
  | VALUE1_1_0 of (string)
  | VALUE1_2_0 of (string)
  | BLANKS
  | CONST_KW
  | FALSE_KW
  | FUNC_KW
  | LET_KW
  | MULTI_LINE_COMMENT
  | RET_KW
  | SINGLE_LINE_COMMENT
  | TRUE_KW
  | UNDEF_KW

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Javascript_ast.start_t
