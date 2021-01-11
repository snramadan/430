fun printPart s =
   TextIO.print ("\n--------- Part" ^ s ^ " ---------\n")
;

printPart "1";
TextIO.print " **** intToString 99;\n"; 
intToString 99;
TextIO.print " **** intToString ~1;\n"; 
intToString ~1;
TextIO.print " **** intToString 12;\n"; 
intToString 12;
TextIO.print " **** intToString ~4729;\n"; 
intToString ~4729;

printPart "2";
TextIO.print " **** twin [];\n"; 
twin [];
TextIO.print " **** twin [1,2,3];\n"; 
twin [1,2,3];
TextIO.print " **** twin [3,2,3,4];\n"; 
twin [3,2,3,4];
TextIO.print " **** twin [\"abc\",\"123\",\"shoe\"];\n"; 
twin ["abc","123","shoe"];

printPart "3";
TextIO.print " **** memberRec ([],1);\n";
memberRec ([],1);
TextIO.print " **** memberRec ([1,2,3], 2);\n";
memberRec ([1,2,3], 2);
TextIO.print " **** memberRec ([1,2,3], 4);\n";
memberRec ([1,2,3], 4);
TextIO.print " **** memberRec ([\"hello\",\"hola\",\"ciao\",\"howdy\"], \"hi\");\n";
memberRec (["hello","hola","ciao","howdy"], "hi");
TextIO.print " **** memberRec ([\"hello\",\"hola\",\"ciao\"], \"hello\");\n";
memberRec (["hello","hola","ciao"], "hello");
TextIO.print " **** memberExists ([],1);\n";
memberExists ([],1);
TextIO.print " **** memberExists ([1,2,3], 2);\n";
memberExists ([1,2,3], 2);
TextIO.print " **** memberExists ([1,2,3], 4);\n";
memberExists ([1,2,3], 4);
TextIO.print " **** memberExists ([\"hello\",\"hola\",\"ciao\",\"howdy\"], \"hi\");\n";
memberExists (["hello","hola","ciao","howdy"], "hi");
TextIO.print " **** memberExists ([\"hello\",\"hola\",\"ciao\"], \"hello\");\n";
memberExists (["hello","hola","ciao"], "hello");

printPart "4";
TextIO.print " **** both (fn x => x > 0, fn x => x < 20) 10;\n";
both (fn x => x > 0, fn x => x < 20) 10;
TextIO.print " **** both (fn x => x > 0, fn x => x < 20) 100;\n";
both (fn x => x > 0, fn x => x < 20) 100;
TextIO.print " **** both (fn x => x > #\"a\", fn x => x < #\"z\") #\"b\";\n";
both (fn x => x > #"a", fn x => x < #"z") #"b";

printPart "5";
TextIO.print " **** satisfiesAll ([], 10);\n";
satisfiesAll ([], 10);
TextIO.print " **** satisfiesAll ([fn x => x > 0, fn x => x < 20], 10);\n";
satisfiesAll ([fn x => x > 0, fn x => x < 20], 10);
TextIO.print " **** satisfiesAll ([fn x => x > 0, fn x => x < 20], 100);\n";
satisfiesAll ([fn x => x > 0, fn x => x < 20], 100);
TextIO.print " **** satisfiesAll ([fn x => x > 0, fn x => x < 20, fn x => x mod 2 = 0], 10);\n";
satisfiesAll ([fn x => x > 0, fn x => x < 20, fn x => x mod 2 = 0], 10);
TextIO.print " **** satisfiesAll ([fn x => x > 0, fn x => x < 20, fn x => x mod 2 = 0], 11);\n";
satisfiesAll ([fn x => x > 0, fn x => x < 20, fn x => x mod 2 = 0], 11);
TextIO.print " **** satisfiesAll ([fn x => x >= #\"a\", fn x => x <= #\"z\", fn x => x <> #\"m\"], #\"a\");\n";
satisfiesAll ([fn x => x >= #"a", fn x => x <= #"z", fn x => x <> #"m"], #"a");
TextIO.print " **** satisfiesAll ([fn x => x >= #\"a\", fn x => x <= #\"z\", fn x => x <> #\"m\"], #\"m\");\n";
satisfiesAll ([fn x => x > #"a", fn x => x < #"z", fn x => x <> #"m"], #"m");

printPart "6";
TextIO.print " **** mapSome (fn x => if x > 0 then SOME x else NONE) [1, 2, ~3, 4, ~55];\n";
mapSome (fn x => if x > 0 then SOME x else NONE) [1, 2, ~3, 4, ~55];
TextIO.print " **** mapSome (fn x => if x > 0 then SOME (Int.toString x) else NONE) [1, 2, ~3, 4, ~55];\n";
mapSome (fn x => if x > 0 then SOME (Int.toString x) else NONE) [1, 2, ~3, 4, ~55];

printPart "7";
TextIO.print " **** prefixBy (fn n => n < 10, [1,4,5,9,10,3,4,21]);\n";
prefixBy (fn n => n < 10, [1,4,5,9,10,3,4,21]);
TextIO.print " **** prefixBy (fn c => Char.isAlpha c, explode \"abc123def\");\n";
prefixBy (fn c => Char.isAlpha c, explode "abc123def");
TextIO.print " **** prefixBy (fn n => n < 10, [1,4,5,9]);\n";
prefixBy (fn n => n < 10, [1,4,5,9]);
TextIO.print " **** prefixBy (fn n => n < 10, [10,4,5,9]);\n";
prefixBy (fn n => n < 10, [10,4,5,9]);

printPart "8";
TextIO.print " **** groupAscending [];\n";
groupAscending [];
TextIO.print " **** groupAscending [1];\n";
groupAscending [1];
TextIO.print " **** groupAscending [1,2,3];\n";
groupAscending [1,2,3];
TextIO.print " **** groupAscending [1,2,3,2,3];\n";
groupAscending [1,2,3,2,3];
TextIO.print " **** groupAscending [4,7,10,2,3,1,99,45,122,123,122,47,46,46,49];\n";
groupAscending [4,7,10,2,3,1,99,45,122,123,122,47,46,46,49];

printPart "9";
TextIO.print " **** unescapeString \"abc\";\n";
unescapeString "abc";
TextIO.print " **** unescapeString \"ab :t c :\\\" :: :n\";\n";
unescapeString "ab :t c :\" :: :n";
TextIO.print " **** unescapeString \"ab:bc\" handle InvalidEscapeSequence c => \"invalid escape :\" ^ str c;\n";
unescapeString "ab:bc" handle InvalidEscapeSequence c =>
   "invalid escape :" ^ str c;
TextIO.print " **** unescapeString \"ab:\" handle InvalidEscapeMissing => \"escape sequence missing character\";\n";
unescapeString "ab:" handle InvalidEscapeMissing =>
   "escape sequence missing character";

printPart "10";
TextIO.print " **** escapeString \"abc\";\n";
escapeString "abc";
TextIO.print " **** escapeString \"ab \\t c \\\" : \\n\";\n";
escapeString "ab \t c \" : \n";
TextIO.print " **** escapeString \"ab ::\\t\\t\\ttt\";\n";
escapeString "ab ::\t\t\ttt";
