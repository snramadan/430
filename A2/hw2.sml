Control.Print.printDepth := 20;
Control.Print.printLength := 100;

datatype 'a List = 
     ListNode of 'a * 'a List
	| EmptyList
;

datatype 'a NTree =
     NTreeNode of {value: 'a, children: 'a NTree list}
	| EmptyNTree
;

(* Part 1 *)
fun both(Pair: ('a -> bool) * ('a -> bool)) (x: 'a) : bool =
   let
	   val f1 = #1 Pair;
		val f2 = #2 Pair;
	in 
      if f1(x) andalso f2(x)
		then true
		else false
	end
;

(* Part 2 *)
fun satisfiesAll((L: ('a -> bool)list), (X: 'a)) : bool =
   case L of
	[] => true
	| x::xs =>
	   if x(X)
		then satisfiesAll(xs, X)
		else false
;

(* Part 3 *)
fun mapSome(F: ('a -> 'b option)) (L: 'a list) : 'b list =
   case L of 
	[] => []
	| x::xs =>
	   case F x of
		   SOME ans => ans :: mapSome F xs
		 | NONE => mapSome F xs
;

(* Part 4 *)
fun memberExists(L: ''a list * ''a) : bool =
   if null (#1 L)
	then false
	else List.exists(fn s => s = (#2 L))(#1 L)
;

(* Part 5 *)
fun getOrElse((L: (''a * 'b)list), (v: ''a), (n: 'b)) : 'b = 
   if null L
	then n
   else 
	     case List.find (fn x => #1 x = v) L of 
		   SOME s => #2 s
		 | NONE => n
;

(* Part 6 *)
fun lengthList(L: 'a List) : int =
   case L of
	EmptyList => 0
	| ListNode (value, next) => 1 + lengthList next
;

(* Part 7 *)
fun mapList(F: ('a -> 'b)) (L: 'a List): 'b List =
   case L of
	EmptyList => EmptyList
	| ListNode (value, next) => ListNode(F value, mapList F next)
;

(* Part 8 *)
fun sumNTree(T: int NTree) : int =
   case T of
	EmptyNTree => 0
	| NTreeNode {value, children} => value + sumNTree(hd children)
;

(* Part 9 *)
fun gatherNTree(T: 'a NTree) : 'a list =
   case T of 
	EmptyNTree => []
	| NTreeNode {value, children} => value :: gatherNTree(hd children)
;

(* Part 10 *)
