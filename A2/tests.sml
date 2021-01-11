fun printPart s =
   TextIO.print ("\n--------- Part" ^ s ^ " ---------\n")
;

printPart "1";
TextIO.print " **** both (fn x => x > 0, fn x => x < 20) 10;\n";
both (fn x => x > 0, fn x => x < 20) 10;
TextIO.print " **** both (fn x => x > 0, fn x => x < 20) 100;\n";
both (fn x => x > 0, fn x => x < 20) 100;
TextIO.print " **** both (fn x => x > #\"a\", fn x => x < #\"z\") #\"b\";\n";
both (fn x => x > #"a", fn x => x < #"z") #"b";


printPart "2";
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


printPart "3";
TextIO.print " **** mapSome (fn x => if x > 0 then SOME x else NONE) [1, 2, ~3, 4, ~55];\n";
mapSome (fn x => if x > 0 then SOME x else NONE) [1, 2, ~3, 4, ~55];
TextIO.print " **** mapSome (fn x => if x > 0 then SOME (Int.toString x) else NONE) [1, 2, ~3, 4, ~55];\n";
mapSome (fn x => if x > 0 then SOME (Int.toString x) else NONE) [1, 2, ~3, 4, ~55];


printPart "4";
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


printPart "5";
TextIO.print " **** getOrElse ([], \"a\", ~99);\n";
getOrElse ([], "a", ~99);
TextIO.print " **** getOrElse ([(\"a\", 9), (\"b\", 7), (\"c\", 12)], \"a\", ~1);\n";
getOrElse ([("a", 9), ("b", 7), ("c", 12)], "a", ~1);
TextIO.print " **** getOrElse ([(\"a\", 9), (\"b\", 7), (\"c\", 12)], \"c\", ~1);\n";
getOrElse ([("a", 9), ("b", 7), ("c", 12)], "c", ~1);
TextIO.print " **** getOrElse ([(\"a\", 9), (\"b\", 7), (\"c\", 12)], \"x\", ~1);\n";
getOrElse ([("a", 9), ("b", 7), ("c", 12)], "x", ~1);
TextIO.print " **** getOrElse ([(0, 9), (1, 7), (2, 12), (3, 19), (4, ~27)], 4, ~1);\n";
getOrElse ([(0, 9), (1, 7), (2, 12), (3, 19), (4, ~27)], 4, ~1);


printPart "6";
TextIO.print " **** lengthList EmptyList;\n";
lengthList EmptyList;
TextIO.print " **** lengthList (ListNode (9, ListNode (3, ListNode (2, EmptyList))));\n";
lengthList (ListNode (9, ListNode (3, ListNode (2, EmptyList))));
TextIO.print " **** lengthList (ListNode (9, ListNode (2, EmptyList)));\n";
lengthList (ListNode (9, ListNode (2, EmptyList)));


printPart "7";
TextIO.print " **** mapList (fn x => x * x) EmptyList;\n";
mapList (fn x => x * x) EmptyList;
TextIO.print " **** mapList (fn x => x * x) (ListNode (9, ListNode (3, ListNode (2, EmptyList))));\n";
mapList (fn x => x * x) (ListNode (9, ListNode (3, ListNode (2, EmptyList))));
TextIO.print " **** mapList (fn x => x + 1) (ListNode (9, ListNode (3, ListNode (2, EmptyList))));\n";
mapList (fn x => x + 1) (ListNode (9, ListNode (3, ListNode (2, EmptyList))));
TextIO.print " **** mapList (fn x => x + 1) (ListNode (9, ListNode (2, EmptyList)));\n";
mapList (fn x => x + 1) (ListNode (9, ListNode (2, EmptyList)));
TextIO.print " **** mapList (fn x => x * x) (ListNode (9, ListNode (2, EmptyList)));\n";
mapList (fn x => x * x) (ListNode (9, ListNode (2, EmptyList)));


printPart "8";

val TreeExmp1 = NTreeNode {value=4,
      children=[
         NTreeNode {value=9, children=[]},
         NTreeNode {value=2, children=[]},
         NTreeNode {value=6, children=[]},
         NTreeNode {value=10, children=[]}
      ]};
val TreeExmp2 = NTreeNode {value=4,
      children=[
         NTreeNode {value=9, children=[NTreeNode {value=12, children=[]}]},
         NTreeNode {value=2, children=[]},
         NTreeNode {value=6, children=[NTreeNode {value=20, children=[]}, EmptyNTree, NTreeNode {value=100, children=[]}]},
         NTreeNode {value=9, children=[NTreeNode {value=19, children=[NTreeNode {value=10, children=[NTreeNode {value=29, children=[]}, NTreeNode {value=39, children=[]}]}]}]}
      ]};

val TreeExmp3 = NTreeNode {value="these",
      children=[
         NTreeNode {value="are", children=[]},
         NTreeNode {value="the", children=[]},
         NTreeNode {value="tree's", children=[]},
         NTreeNode {value="values", children=[]}
      ]};

TextIO.print " **** sumNTree EmptyNTree;\n";
sumNTree EmptyNTree;
TextIO.print " **** sumNTree (NTreeNode {value=4, children=[]});\n";
sumNTree (NTreeNode {value=4, children=[]});
TextIO.print " **** sumNTree (NTreeNode {value=4, children=[EmptyNTree]});\n";
sumNTree (NTreeNode {value=4, children=[EmptyNTree]});
TextIO.print " **** sumNTree TreeExmp1;\n";
sumNTree TreeExmp1;
TextIO.print " **** sumNTree TreeExmp2;\n";
sumNTree TreeExmp2;

printPart "9";
TextIO.print " **** gatherNTree EmptyNTree;\n";
gatherNTree EmptyNTree;
TextIO.print " **** gatherNTree (NTreeNode {value=4, children=[]});\n";
gatherNTree (NTreeNode {value=4, children=[]});
TextIO.print " **** gatherNTree (NTreeNode {value=4, children=[EmptyNTree]});\n";
gatherNTree (NTreeNode {value=4, children=[EmptyNTree]});
TextIO.print " **** gatherNTree TreeExmp1;\n";
gatherNTree TreeExmp1;
TextIO.print " **** gatherNTree TreeExmp2;\n";
gatherNTree TreeExmp2;
TextIO.print " **** gatherNTree TreeExmp3;\n";
gatherNTree TreeExmp3;

printPart "10";

TextIO.print " **** foldNTree (fn (v, kids') => v :: (List.concat kids')) [] TreeExmp1;\n";
foldNTree (fn (v, kids') => v :: (List.concat kids')) [] TreeExmp1;
TextIO.print " **** foldNTree (fn (v, kids') => v :: (List.concat kids')) [] TreeExmp2;\n";
foldNTree (fn (v, kids') => v :: (List.concat kids')) [] TreeExmp2;
TextIO.print " **** foldNTree (fn (v, kids') => v :: (List.concat kids')) [] TreeExmp3;\n";
foldNTree (fn (v, kids') => v :: (List.concat kids')) [] TreeExmp3;
TextIO.print " **** foldNTree (fn (v, kids') => String.concatWith \" \" (v :: kids')) \"\" TreeExmp3;\n";
foldNTree (fn (v, kids') => String.concatWith " " (v :: kids')) "" TreeExmp3;
TextIO.print " **** foldNTree (fn (v, kids') => String.concatWith \" \" (List.filter (fn x => x <> \"\") (Int.toString v :: kids'))) \"\" TreeExmp2;\n";
foldNTree (fn (v, kids') => String.concatWith " " (List.filter (fn x => x <> "") (Int.toString v :: kids'))) "" TreeExmp2;
TextIO.print " **** foldNTree (fn (v, kids') => v + (List.foldl op+ 0 kids')) 0 TreeExmp1;\n";
foldNTree (fn (v, kids') => v + (List.foldl op+ 0 kids')) 0 TreeExmp1;
TextIO.print " **** foldNTree (fn (v, kids') => v + (List.foldl op+ 0 kids')) 0 TreeExmp2;\n";
foldNTree (fn (v, kids') => v + (List.foldl op+ 0 kids')) 0 TreeExmp2;
