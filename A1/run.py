import os
import subprocess
import sys

SMLdefault = '/home/akeen/public/ml/bin/sml'
expected_source = br'hw1.sml'

if not os.path.exists(expected_source):
   print("must provide source file '{}'".format(expected_source.decode("utf-8") ))
   sys.exit(1)

SML = os.environ.get('SML')
if not SML:
   print('$SML not set: trying default of {}'.format(SMLdefault))
   SML = SMLdefault

if not os.path.exists(SML):
   print("{} does not exist".format(SML))
   sys.exit(1)

grep_args = ["grep", "-v",
   "-e", "GC #",
   "-e", "Standard ML",
   "-e", "autoloading",
   "-e", "unit",
   "-e", "Warning",
   "-e", "dummy",
   "-e", "library",
   "-e", "FD",
   "-e", "stdin",
   "-e", "^- $"]

bootstrap = br'''
val devnull = Posix.FileSys.openf ("/dev/null", Posix.FileSys.O_WRONLY, Posix.FileSys.O.trunc);
val sout = Posix.IO.dup(Posix.FileSys.stdout);
Posix.IO.dup2 {old=devnull, new=Posix.FileSys.stdout};

Control.Print.printDepth := 20;
Control.Print.printLength := 100;

exception InvalidEscapeSequence of char;
exception InvalidEscapeMissing;
exception InvalidTokenStart of char;

use "''' + expected_source + br'''";

Posix.IO.dup2 {old=sout, new=Posix.FileSys.stdout};

use "tests.sml";
'''

grep = subprocess.Popen(grep_args, bufsize=-1, stdin=subprocess.PIPE)
sml = subprocess.Popen(SML, bufsize=-1, stdin=subprocess.PIPE, stdout=grep.stdin, stderr=subprocess.STDOUT)
sml.communicate(bootstrap)
grep.communicate()
