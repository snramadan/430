Control.Print.printDepth := 20;
Control.Print.printLength := 100;

(* Part 1 *)
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

(* Part 2 *)
fun twin(L:'a list): ('a * 'a)list =
   if null L
	then []
	else (hd L, hd L) :: twin(tl L)
;

(* Part 3 *)
fun memberRec(L: ''a list * ''a): bool =
   if null (#1 L)
	then false
	else
		if (hd(#1 L)) = (#2 L)
		then true
		else memberRec(tl(#1 L), (#2 L));
;

(* Part 4 *)
fun replace((n: int), (v: 'a), (L: 'a list)) : 'a list =
   if null (L)
	then []
	else 
		if n = 0
		then v :: tl L  
		else hd L :: replace(n-1, v, tl L) 
;

(* Part 5 *)
fun whitespacePrefix(L: char list): string * char list =
   case L of
	[] => ("",[])
	| x::xs =>
		let 
		   val (str, l1) = whitespacePrefix(xs);
		in 
         if Char.isSpace x
         then (String.implode((x) :: String.explode(str)) , l1)
         else ("", L)
		end
;

fun numberPrefix(L: char list): string * char list =
   case L of
	[] => ("",[])
	| x::xs =>
		let 
		   val (str, l1) = numberPrefix(xs);
		in 
         if Char.isDigit x
         then (String.implode((x) :: String.explode(str)) , l1)
         else ("", L)
		end
;

fun identifierPrefix(L: char list): string * char list =
   case L of
	[] => ("",[])
	| x::xs =>
	   let 
		   val (str, l1) = identifierPrefix(xs);
		in 
         if Char.isAlphaNum x
         then (String.implode((x) :: String.explode(str)) , l1)
		   else ("", L)
      end
;

(* Part 6 *)
exception InvalidTokenStart of char;
fun splitTokens(str: string) : string list =
   let
	   val L = String.explode str;
	in
	   case L of
		[] => []
		| x::xs =>
		   if Char.isAlpha x
			then 
			   let 
				   val (str, l) = identifierPrefix(L);
				in
				   str :: splitTokens(String.implode(l))
				end
			else if Char.isDigit x
			then 
			   let 
				   val (str, l) = numberPrefix(L);
				in
				   str :: splitTokens(String.implode(l))
				end
			else if Char.isSpace x 
			then splitTokens(String.implode(xs))
			else raise InvalidTokenStart x
	end
;

(* Part 7 *)
fun join((str: string), (L: string list)): string =
   if null L
	then ""
	else
		if null (tl L) 
		then hd L 
		else hd L ^ str ^ join(str, tl L)
;

(* Part 8 *)
fun escapeString(str: string) : string =
   let
	   val L = String.explode str;
	in
	   case L of
		[] => ""
		| x::xs =>
	      if x = #"\t"
			then "\\" ^ "t" ^ escapeString(String.implode (xs))
	      else if x = #"\n"
			then "\\" ^ "n" ^ escapeString(String.implode (xs))
	      else if x = #"\""
			then "\\" ^ "\"" ^ escapeString(String.implode (xs))		
	      else if x = #"\\"
			then "\\" ^ "\\" ^ escapeString(String.implode (xs))
			else (String.implode (x :: [])) ^ escapeString(String.implode (xs))
	end
;

(* Part 9 *)
exception InvalidEscapeSequence of char;
exception InvalidEscapeMissing;

fun unescapeString(str: string) : string =
   let
	   val L = String.explode str;
	in
	   case L of
		[] => ""
		| x::xs =>
	      if x = #"\\" 
		   then
			   if (hd xs) = #"t"
			   then "\t" ^ unescapeString(String.implode (tl xs))
	         else  if (hd xs) = #"n"
			   then "\n" ^ unescapeString(String.implode (tl xs))
	         else if (hd xs) = #"\""
			   then "\"" ^ unescapeString(String.implode (tl xs))
	         else if (hd xs) = #"\\"
			   then "\\" ^ unescapeString(String.implode (tl xs)) 
				else if Char.isAlpha (hd xs)
			   then raise InvalidEscapeSequence(hd xs)
			   else if null xs
			   then raise InvalidEscapeMissing
				else if (hd xs) = #" "
				then raise InvalidEscapeMissing 
				else raise InvalidEscapeMissing
			else (String.implode (x :: [])) ^ unescapeString(String.implode (xs))
	end
;

(* Part 10 *)
fun groupAscending(L: int list) : int list list =
   case L of
	[] => []
	| x::xs =>
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
