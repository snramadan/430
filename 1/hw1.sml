Control.Print.printDepth := 20;
Control.Print.printLength := 100;

(* part 1 *)
fun intToString(n:int):string =
	if n > 0
	then Int.toString(n)
	else 
		let 
			val result = n * ~1;
		in 
			"-" ^ Int.toString(result)
		end
;

(* part 2 *)
fun twin(L:'a list): ('a * 'a)list =
	if null L
	then []
   else (hd L, hd L) :: twin(tl L)
;

(* part 3 *)
fun memberRec(L: ''a list * ''a): bool=
	if null (#1 L)
	then false
	else 
		if (hd(#1 L)) = (#2 L)
		then true
		else memberRec(tl(#1 L), (#2 L));
;

(* part 3 *)
fun memberExists(L:''a list  * ''a): bool=
	if null (#1 L)
	then false
	else List.exists(fn s => s = (#2 L))(#1 L)
;

(* part 4 *)
fun both(PAIR:('a -> bool)*('a -> bool)) (X: 'a): bool =
	let 
		val func1 = (#1 PAIR);
		val func2 = (#2 PAIR);
	in 
		if (func1(X) andalso func2(X))
		then true
		else false
	end
;

(* part 5 *)
fun satisfiesAll((L:('a -> bool)list) , (X: 'a)): bool =
	case L of 
	[] => true
	| x :: xs =>
		if (x(X))
		then satisfiesAll(xs, X)
		else false
;

(* part 6 *)
fun mapSome (F: ('a -> 'b option)) (L:'a list): 'b list =
	case L of 
	[] => []
   | x::xs => 
		case F x of 
			SOME ans => ans :: mapSome F xs
		 | NONE => mapSome F xs
;

(* part 7 *)
fun prefixBy ((P: 'a -> bool), (L: 'a list)): 'a list * 'a list =
	case L of 
	[] => ([],[])
	| x::xs =>
		let 
			val (less, greater) = prefixBy (P, xs);
		in
			if P(x)
			then (x::less, greater)
			else (less, x::greater)
		end
;

(* part 8 *)
fun groupAscending (L: int list): int list list = 
	case L of
   [] => []
	| x::xs	=>
	   let
			val l1 = groupAscending(xs);
		in
		   if null l1
			then [[x]]
			else if x >= (hd xs) 
			then [x]::hd l1::tl l1
			else (x::(hd l1))::tl l1
		end
;

(* part 9 
fun unescapeStriang *)

(* part 10
fun escapeString (s: string) : string =
	let
		val ch = 
	in 
	end
;*)
