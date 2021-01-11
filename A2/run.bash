#!/bin/bash -f

defaultSML=/home/akeen/public/ml/bin/sml
expected_source=hw2.sml

if [ ! -f ${expected_source} ]; then
   echo "must provide source file '${expected_source}'"
   exit 1
fi

if [ -z ${SML} ]; then
   echo "SML not set: using default of ${defaultSML}"
   SML=${defaultSML}
fi

if [ ! -f ${SML} ]; then
   echo "${SML} does not exist"
   exit 1
fi

${SML} &> tmp << END
val devnull = Posix.FileSys.openf ("/dev/null", Posix.FileSys.O_WRONLY, Posix.FileSys.O.trunc);
val sout = Posix.IO.dup(Posix.FileSys.stdout);
Posix.IO.dup2 {old=devnull, new=Posix.FileSys.stdout};

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


use "${expected_source}";

Posix.IO.dup2 {old=sout, new=Posix.FileSys.stdout};

use "tests.sml";
END

grep -v -e "GC #" -e "Standard ML" -e "autoloading" -e "unit" -e "Warning" -e "dummy" -e "library" -e "FD" -e '^- $' -e "stdin" tmp
rm tmp

