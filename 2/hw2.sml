Control.Print.printDepth := 20;
Control.Print.printLength := 100;

datatype 'a List =
	  ListNode of {value: 'a, next:'a List}
   | EmptyList
;

datatype 'a BinTree = 
	  BinTreeNode of {value: 'a, lft: 'a BinTree, rht: 'a BinTree}
	| EmptyBinTree
;

datatype expression =
	ID of string
 | NUM of int
 | PLUS of expression * expression 
 | TIMES of expression * expression
;

(*datatype expression2 =
	INT of int
 | ADD of expression2 * expression2
 | MULT of expression2 * expression2
 | LESSTHAN of expression2 * expression2
;

datatype value = 
	INT_VAL
 | BOOL_VAL 
 | ERROR_VAL 
;*)

(* 1 *)
fun lengthList(L: 'a List) : int =
	case L of
	EmptyList => 0
	| ListNode {value, next} => 1 + lengthList next
;

(* 2 *)
fun mapList(F:('a -> 'b)) (L: 'a List): 'b List =
	case L of
	EmptyList => EmptyList
	| ListNode {value, next} => ListNode{value = F value, next = mapList F next}
;

(* 4 *)
fun mapBinTree(F: ('a -> 'b)) (T: 'a BinTree) : 'b BinTree =
	case T of 
	EmptyBinTree => EmptyBinTree
	| BinTreeNode {value, lft, rht} => BinTreeNode{value = F value, lft = mapBinTree F lft, rht = mapBinTree F rht}
;

(* 5 *)
fun gatherIdentifiers(E: expression) : string list =
	case E of 
	ID str => [str]
	| NUM n => []
	| PLUS (left, right) => gatherIdentifiers left @ gatherIdentifiers right
	| TIMES (left, right) => gatherIdentifiers left @ gatherIdentifiers right
;
 
(* 6 *)
fun compute(E: expression) : int =
	case E of 
	ID ident => 2
	| NUM n => n
	| PLUS (left, right) => compute left + compute right
	| TIMES (left, right) => compute left * compute right
;

(* 7 *)
fun simplifyIdentities (E: expression) : expression = 
	case E of 
	ID ident => ID ident
	| NUM n => NUM n
	| PLUS (left, right) => 
		if (simplifyIdentities left) = NUM 0
		then simplifyIdentities right
		else if (simplifyIdentities right) = NUM 0
		then simplifyIdentities left
		else PLUS (simplifyIdentities left, simplifyIdentities right)
	| TIMES (left, right) => 
		if (simplifyIdentities left) = NUM 1
		then simplifyIdentities right
		else if (simplifyIdentities right) = NUM 1
		then simplifyIdentities left
		else TIMES (simplifyIdentities left, simplifyIdentities right)
;

(* 8 *)
fun foldConstants (E: expression) : expression =
	case E of
	ID ident => ID ident
	| NUM n => NUM n
	| PLUS (left, right) => PLUS (foldConstants left, foldConstants right)
	| TIMES (left, right) => TIMES (foldConstants left, foldConstants right)
;


(* 9 
fun mixed_compute (E: expression2) : value =
	case E of 
	INT x => x
	| ADD (left, right) => mixed_compute left + mixed_compute right
	| MULT (left, right) => mixed_compute left * mixed_compute right
	| LESSTHAN (left, right) => mixed_compute left < mixed_compute right
;*)
