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

printPart "4";
TextIO.print " **** replace (3, 4, []);\n";
replace (3, 4, []);
TextIO.print " **** replace (0, 4, []);\n";
replace (0, 4, []);
TextIO.print " **** replace (3, \"new\", [\"a\", \"b\", \"c\", \"d\", \"e\"]);\n";
replace (3, "new", ["a", "b", "c", "d", "e"]);
TextIO.print " **** replace (0, 9, [1, 2, 3, 4]);\n";
replace (0, 9, [1, 2, 3, 4]);
TextIO.print " **** replace (1, 9, [1, 2, 3, 4]);\n";
replace (1, 9, [1, 2, 3, 4]);
TextIO.print " **** replace (2, 9, [1, 2, 3, 4]);\n";
replace (2, 9, [1, 2, 3, 4]);
TextIO.print " **** replace (3, 9, [1, 2, 3, 4]);\n";
replace (3, 9, [1, 2, 3, 4]);
TextIO.print " **** replace (4, 9, [1, 2, 3, 4]);\n";
replace (4, 9, [1, 2, 3, 4]);
TextIO.print " **** replace (27, 9, [1, 2, 3, 4]);\n";
replace (27, 9, [1, 2, 3, 4]);
TextIO.print " **** replace (~1, 9, [1, 2, 3, 4]);\n";
replace (~1, 9, [1, 2, 3, 4]);

printPart "5";
TextIO.print " **** whitespacePrefix [];\n";
whitespacePrefix [];
TextIO.print " **** whitespacePrefix [#\"a\", #\"2\", #\"c\", #\" \", #\"a\"];\n";
whitespacePrefix [#"a", #"2", #"c", #" ", #"a"];
TextIO.print " **** whitespacePrefix [#\" \", #\"\\t\", #\" \", #\"a\"];\n";
whitespacePrefix [#" ", #"\t", #" ", #"a"];
TextIO.print " **** numberPrefix [];\n";
numberPrefix [];
TextIO.print " **** numberPrefix [#\"a\", #\"2\", #\"c\", #\" \", #\"a\"];\n";
numberPrefix [#"a", #"2", #"c", #" ", #"a"];
TextIO.print " **** numberPrefix [#\"2\", #\"3\", #\" \", #\"a\"];\n";
numberPrefix [#"2", #"3", #" ", #"a"];
TextIO.print " **** numberPrefix [#\"2\", #\"3\", #\"-\", #\"a\"];\n";
numberPrefix [#"2", #"3", #"-", #"a"];
TextIO.print " **** identifierPrefix [];\n";
identifierPrefix [];
TextIO.print " **** identifierPrefix [#\"a\", #\"2\", #\"c\", #\" \", #\"a\"];\n";
identifierPrefix [#"a", #"2", #"c", #" ", #"a"];
TextIO.print " **** identifierPrefix [#\"2\", #\"c\", #\" \", #\"a\"];\n";
identifierPrefix [#"2", #"c", #" ", #"a"];
TextIO.print " **** identifierPrefix [#\" \", #\"c\", #\" \", #\"a\"];\n";
identifierPrefix [#" ", #"c", #" ", #"a"];

printPart "6";
TextIO.print " **** splitTokens \"abc xyz\";\n";
splitTokens "abc xyz";
TextIO.print " **** splitTokens \"   123 456   \";\n";
splitTokens "   123 456   ";
TextIO.print " **** splitTokens \"abc123  xyz\";\n";
splitTokens "abc123  xyz";
TextIO.print " **** splitTokens \"abc 123  \\t xyz\";\n";
splitTokens "abc 123  \t xyz";
TextIO.print " **** splitTokens \"004abc123\";\n";
splitTokens "004abc123";
TextIO.print " **** splitTokens \"100-90\" handle InvalidTokenStart c => [\"invalid character '\" ^ str c ^ \"'\"];\n";
splitTokens "100-90" handle InvalidTokenStart c => ["invalid character '" ^ str c ^ "'"];

printPart "7";
TextIO.print " **** join(\", \", [\"first\", \"second\"]);\n";
join(", ", ["first", "second"]);
TextIO.print " **** join(\",\", [\"first\", \"second\"]);\n";
join(",", ["first", "second"]);
TextIO.print " **** join(\":\", [\"a\", \"b\", \"c\", \"d\"]);\n";
join(":", ["a", "b", "c", "d"]);
TextIO.print " **** join(\":\", [\"only\"]);\n";
join(":", ["only"]);
TextIO.print " **** join(\":\", []);\n";
join(":", []);

printPart "8";
TextIO.print " **** escapeString \"abc\";\n";
escapeString "abc";
TextIO.print " **** escapeString \"ab \\t c \\\" \\\\ \\n\";\n";
escapeString "ab \t c \" \\ \n";
TextIO.print " **** escapeString \"ab \\\\ \\t\\t\\ttt\";\n";
escapeString "ab \\ \t\t\ttt";

printPart "9";
TextIO.print " **** unescapeString \"abc\";\n";
unescapeString "abc";
TextIO.print " **** unescapeString \"ab \\\\t c \\\\\\\" \\\\\\\\ \\\\n\";\n";
unescapeString "ab \\t c \\\" \\\\ \\n";
TextIO.print " **** unescapeString \"ab\\\\bc\" handle InvalidEscapeSequence c => \"invalid escape \\\\\" ^ str c;\n";
unescapeString "ab\\bc" handle InvalidEscapeSequence c =>
   "invalid escape \\" ^ str c;
TextIO.print " **** unescapeString \"ab\\\\\" handle InvalidEscapeMissing => \"escape sequence missing character\";\n";
unescapeString "ab\\" handle InvalidEscapeMissing =>
   "escape sequence missing character";

printPart "10";
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
