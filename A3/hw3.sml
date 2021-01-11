Control.Print.printDepth := 20;
Control.Print.printLength := 100;

datatype arith_expression =
   AE_NUM of int
 | AE_PLUS of arith_expression * arith_expression
 | AE_MINUS of arith_expression * arith_expression
 | AE_TIMES of arith_expression * arith_expression
 | AE_DIVIDE of arith_expression * arith_expression
;

(datatype mixed_expression =
   ME_NUM of int
 | ME_PLUS of mixed_expression * mixed_expression
 | ME_TIMES of mixed_expression * mixed_expression
 | ME_LESSTHAN of mixed_expression * mixed_expression
;

datatype value =
   INT_VAL of int
 | BOOL_VAL of bool
 | ERROR_VAL
;

datatype var_expression =
   VE_NUM of int
 | VE_ID of string
 | VE_PLUS of var_expression * var_expression
 | VE_TIMES of var_expression * var_expression
;

(*datatype operator =
   OP_PLUS
 | OP_TIMES
;

datatype expression =
   NUM of int
 | ID of string
 | BINARY of {opr: operator, lft: expression, rht: expression}
 | FUNCTION of {parameter: string, body: expression}
 | CALL of {func: expression, argument: expression}
;*)

(* Part 1 *)
fun arithInfixString(E: arith_expression) : string =
	case E of
	AE_NUM n => Int.toString(n)
	| AE_PLUS (left, right) => "(" ^ (arithInfixString left) ^ " + " ^ (arithInfixString right) ^ ")"
	| AE_MINUS (left, right) => "(" ^ (arithInfixString left) ^ " - " ^ (arithInfixString right) ^ ")"
	| AE_TIMES (left, right) => "(" ^ (arithInfixString left) ^ " * " ^ (arithInfixString right) ^ ")"
	| AE_DIVIDE (left, right) => "(" ^ (arithInfixString left) ^ " / " ^ (arithInfixString right) ^ ")"
;

fun arithPrefixString(E: arith_expression) : string =
	case E of
	AE_NUM n => Int.toString(n)
	| AE_PLUS (left, right) => "(+ " ^ (arithPrefixString left) ^ " " ^ (arithPrefixString right) ^ ")"
	| AE_MINUS (left, right) => "(- " ^ (arithPrefixString left) ^ " " ^ (arithPrefixString right) ^ ")"
	| AE_TIMES (left, right) => "(* " ^ (arithPrefixString left) ^ " " ^ (arithPrefixString right) ^ ")"
	| AE_DIVIDE (left, right) => "(/ " ^ (arithPrefixString left) ^ " " ^ (arithPrefixString right) ^ ")"
;

(* Part 2 *)
fun evalArith(E: arith_expression) : int =
   case E of 
	AE_NUM n => n
	| AE_PLUS (left, right) => evalArith left + evalArith right
	| AE_MINUS (left, right) => evalArith left - evalArith right
	| AE_TIMES (left, right) => evalArith left * evalArith right
	| AE_DIVIDE (left, right) => evalArith left div evalArith right
;

(* Part 3 *)
fun evalMixed(E: mixed_expression) : value =
   case E of
	ME_NUM n => n
	| ME_PLUS (left, right) => evalMixed left + evalMixed right
	| ME_TIMES (left. right) => evalMixed left * evalMixed right
	| ME_LESSTHAN (left, right) => 
	   if evalMixed left
		then ERROR_VAL
		else if evalMixed right
		then ERROR_VAL
		else if evalMixed left < evalMixed right
		then true
		else false
;

(* Part 4 *)
fun simplifyIdentities(E: var_expression) : var_expression =
   case E of
	VE_NUM n => VE_NUM n
	| VE_ID id => VE_ID id
	| VE_PLUS (left, right) =>
	   if (simplifyIdentities left) = VE_NUM 0
		then simplifyIdentities right
	   else if (simplifyIdentities right) = VE_NUM 0
		then simplifyIdentities left
	   else VE_PLUS (simplifyIdentities left, simplifyIdentities right)
	| VE_TIMES (left, right) =>
	   if (simplifyIdentities left) = VE_NUM 1
		then simplifyIdentities right
	   else if (simplifyIdentities right) = VE_NUM 1
		then simplifyIdentities left
	   else VE_TIMES (simplifyIdentities left, simplifyIdentities right)
;

(* Part 5 *)
fun foldConstants(E: var_expression) : var_expression =
   case E of
	VE_NUM n => VE_NUM n
	| VE_ID id => VE_ID id
   | VE_PLUS (left, right) => VE_PLUS (foldConstants left, foldConstants right)
	| VE_TIMES (left, right) => VE_TIMES (foldConstants left, foldConstants right)
;

(*(* Part 6 *)
fun gatherIdentifiers(E: expression) : string list =
   case E of
	NUM n => []
	| ID id => [id]
	| BINARY {opr, lft, rht} => BINARY {opr = opr, lft = gatherIdentifiers lft, rht = gatherIdentifiers rht}
	| FUNCTION {parameter, body} => FUNCTION {parameter = gatherIdentifiers parameter, body}
	| CALL {func, argument} =>
;*)

(* Part 7 *)
(* Part 8 *)
(* Part 9 *)
(* Part 10 *)
