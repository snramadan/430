fun printPart s =
   TextIO.print ("\n--------- Part" ^ s ^ " ---------\n")
;

printPart "1";
TextIO.print " **** lengthList EmptyList;\n";
lengthList EmptyList;
TextIO.print " **** lengthList (ListNode {value=9, next=ListNode {value=3, next=ListNode {value=2, next=EmptyList}}});\n";
lengthList (ListNode {value=9, next=ListNode {value=3, next=ListNode {value=2, next=EmptyList}}});
TextIO.print " **** lengthList (ListNode {value=9, next=ListNode {value=2, next=EmptyList}});\n";
lengthList (ListNode {value=9, next=ListNode {value=2, next=EmptyList}});

printPart "2";
TextIO.print " **** mapList (fn x => x * x) EmptyList;\n";
mapList (fn x => x * x) EmptyList;
TextIO.print " **** mapList (fn x => x * x) (ListNode {value=9, next=ListNode {value=3, next=ListNode {value=2, next=EmptyList}}});\n";
mapList (fn x => x * x) (ListNode {value=9, next=ListNode {value=3, next=ListNode {value=2, next=EmptyList}}});
TextIO.print " **** mapList (fn x => x + 1) (ListNode {value=9, next=ListNode {value=3, next=ListNode {value=2, next=EmptyList}}});\n";
mapList (fn x => x + 1) (ListNode {value=9, next=ListNode {value=3, next=ListNode {value=2, next=EmptyList}}});
TextIO.print " **** mapList (fn x => x + 1) (ListNode {value=9, next=ListNode {value=2, next=EmptyList}});\n";
mapList (fn x => x + 1) (ListNode {value=9, next=ListNode {value=2, next=EmptyList}});
TextIO.print " **** mapList (fn x => x * x) (ListNode {value=9, next=ListNode {value=2, next=EmptyList}});\n";
mapList (fn x => x * x) (ListNode {value=9, next=ListNode {value=2, next=EmptyList}});

printPart "3";
TextIO.print " **** check Java tests at end ****\n";

printPart "4";
val Bexmp1 =
BinTreeNode
   {value=1,
    lft=BinTreeNode {value=9, lft=EmptyBinTree, rht=EmptyBinTree},
    rht=BinTreeNode {value=4, lft=EmptyBinTree, rht=EmptyBinTree}
   }
;
val Bexmp2 =
BinTreeNode
   {value=4,
    lft=BinTreeNode {value=2, lft=EmptyBinTree, rht=EmptyBinTree},
    rht=EmptyBinTree
   }
;
val Bexmp3 =
BinTreeNode
   {value=4,
    rht=BinTreeNode {value=2, lft=EmptyBinTree, rht=EmptyBinTree},
    lft=EmptyBinTree
   }
;
val Bexmp =
BinTreeNode
   {value=12,
    lft=BinTreeNode {value=0, lft=Bexmp1, rht=Bexmp2},
    rht=Bexmp3
   }
;

TextIO.print " **** mapBinTree (fn x => x + 1) Bexmp;\n";
mapBinTree (fn x => x + 1) Bexmp;
TextIO.print " **** mapBinTree (fn x => x * 2) EmptyBinTree;\n";
mapBinTree (fn x => x * 2) EmptyBinTree;
TextIO.print " **** mapBinTree (fn x => x * x) Bexmp;\n";
mapBinTree (fn x => x * x) Bexmp;

printPart "5";
val exp1 = NUM 2;
val exp2 = ID "a";
val exp3 = PLUS (NUM 2, ID "a");
val exp4 = TIMES (NUM 2, ID "a");
val exp5 = (PLUS (TIMES (NUM 2, ID "a"), PLUS (ID "b", ID "x")));
val exp6 = PLUS (PLUS (PLUS (PLUS (PLUS (PLUS (NUM 1, TIMES (NUM 2, NUM 3)), TIMES (ID "a", NUM 4)), NUM 3), NUM 2), TIMES (NUM 7, NUM 2)), PLUS (PLUS (NUM 9, NUM 4), ID "b"));
val exp7 = PLUS (PLUS (PLUS (PLUS (PLUS (PLUS (NUM 1, TIMES (NUM 2, NUM 3)), TIMES (NUM 2, NUM 4)), NUM 3), NUM 2), TIMES (NUM 7, NUM 2)), PLUS (PLUS (NUM 9, NUM 4), ID "b"));
val exp8 = PLUS (TIMES (NUM 1, ID "a"), PLUS (NUM 0, NUM 0));
val exp9 = PLUS (PLUS (PLUS (PLUS (PLUS (PLUS (NUM 0, TIMES (NUM 2, NUM 3)), TIMES (NUM 2, NUM 4)), NUM 3), NUM 2), TIMES (NUM 7, NUM 1)), PLUS (PLUS (NUM 9, NUM 4), ID "b"));

TextIO.print " **** gatherIdentifiers exp1;\n";
gatherIdentifiers exp1;
TextIO.print " **** gatherIdentifiers exp2;\n";
gatherIdentifiers exp2;
TextIO.print " **** gatherIdentifiers exp3;\n";
gatherIdentifiers exp3;
TextIO.print " **** gatherIdentifiers exp4;\n";
gatherIdentifiers exp4;
TextIO.print " **** gatherIdentifiers exp5;\n";
gatherIdentifiers exp5;
TextIO.print " **** gatherIdentifiers exp6;\n";
gatherIdentifiers exp6;
TextIO.print " **** gatherIdentifiers exp7;\n";
gatherIdentifiers exp7;
TextIO.print " **** gatherIdentifiers exp8;\n";
gatherIdentifiers exp8;
TextIO.print " **** gatherIdentifiers exp9;\n";
gatherIdentifiers exp9;

printPart "6";
val compute0 = NUM 9;
val compute1 = PLUS (NUM 3, NUM 4);
val compute2 = PLUS (PLUS (NUM 9, NUM 4), PLUS (NUM 9, NUM 3));
val compute3 = PLUS (PLUS (NUM 9, NUM 3), TIMES (NUM 2, NUM 4));
val compute4 = TIMES (PLUS (NUM 9, NUM 3), PLUS (NUM 2, NUM 4));
val compute5 = TIMES (PLUS (NUM 6, PLUS (NUM 9, PLUS (NUM 3, NUM 10))), PLUS (NUM 2, NUM 4));
val compute6 = TIMES (PLUS (NUM 6, TIMES (NUM 9, PLUS (NUM 3, NUM 10))), TIMES (NUM 2, NUM 4));
val compute7 = PLUS (TIMES (NUM 9, ID "a"), TIMES (ID "b", NUM 9));
val compute8 = PLUS (PLUS (TIMES (NUM 9, ID "a"), TIMES (ID "b", NUM 9)), NUM 4);
val compute9 = TIMES (TIMES (PLUS (TIMES (NUM 9, ID "a"), TIMES (ID "b", NUM 9)), NUM 4), NUM 3);
val compute10 = (PLUS (PLUS (TIMES (NUM 9, ID "a"), TIMES (ID "b", NUM 9)), TIMES (NUM 9, NUM 2)));

TextIO.print " **** compute compute0;\n";
compute compute0;
TextIO.print " **** compute compute1;\n";
compute compute1;
TextIO.print " **** compute compute2;\n";
compute compute2;
TextIO.print " **** compute compute3;\n";
compute compute3;
TextIO.print " **** compute compute4;\n";
compute compute4;
TextIO.print " **** compute compute5;\n";
compute compute5;
TextIO.print " **** compute compute6;\n";
compute compute6;
TextIO.print " **** compute compute7;\n";
compute compute7;
TextIO.print " **** compute compute8;\n";
compute compute8;
TextIO.print " **** compute compute9;\n";
compute compute9;
TextIO.print " **** compute compute10;\n";
compute compute10;

printPart "7";
TextIO.print " **** simplifyIdentities exp1;\n";
simplifyIdentities exp1;
TextIO.print " **** simplifyIdentities exp2;\n";
simplifyIdentities exp2;
TextIO.print " **** simplifyIdentities exp3;\n";
simplifyIdentities exp3;
TextIO.print " **** simplifyIdentities exp4;\n";
simplifyIdentities exp4;
TextIO.print " **** simplifyIdentities exp5;\n";
simplifyIdentities exp5;
TextIO.print " **** simplifyIdentities exp6;\n";
simplifyIdentities exp6;
TextIO.print " **** simplifyIdentities exp7;\n";
simplifyIdentities exp7;
TextIO.print " **** simplifyIdentities exp8;\n";
simplifyIdentities exp8;
TextIO.print " **** simplifyIdentities exp9;\n";
simplifyIdentities exp9;

printPart "8";
TextIO.print " **** foldConstants exp1;\n";
foldConstants exp1;
TextIO.print " **** foldConstants exp2;\n";
foldConstants exp2;
TextIO.print " **** foldConstants exp3;\n";
foldConstants exp3;
TextIO.print " **** foldConstants exp4;\n";
foldConstants exp4;
TextIO.print " **** foldConstants exp5;\n";
foldConstants exp5;
TextIO.print " **** foldConstants exp6;\n";
foldConstants exp6;
TextIO.print " **** foldConstants exp7;\n";
foldConstants exp7;
TextIO.print " **** foldConstants exp8;\n";
foldConstants exp8;
TextIO.print " **** foldConstants exp9;\n";
foldConstants exp9;

printPart "9";
TextIO.print "mixed_compute (INT 1);\n";
mixed_compute (INT 1);
TextIO.print "mixed_compute (ADD (INT 1, INT 2));\n";
mixed_compute (ADD (INT 1, INT 2));
TextIO.print "mixed_compute (ADD (MULT (INT 4, INT 2), INT 2));\n";
mixed_compute (ADD (MULT (INT 4, INT 2), INT 2));
TextIO.print "mixed_compute (LESSTHAN (ADD (INT 4, INT 9),ADD (MULT (INT 4, INT 3), INT 2)));\n";
mixed_compute (LESSTHAN (ADD (INT 4, INT 9),ADD (MULT (INT 4, INT 3), INT 2)));
TextIO.print "mixed_compute (LESSTHAN (LESSTHAN (INT 4, INT 9),ADD (MULT (INT 4, INT 2), INT 2)));\n";
mixed_compute (LESSTHAN (LESSTHAN (INT 4, INT 9),ADD (MULT (INT 4, INT 2), INT 2)));
TextIO.print "mixed_compute (ADD (LESSTHAN (INT 4, INT 1), INT 2));\n";
mixed_compute (ADD (LESSTHAN (INT 4, INT 1), INT 2));

printPart "10";
TextIO.print " **** wordsFromFile \"wordsFromFile.input\";\n";
wordsFromFile "wordsFromFile.input";
