BSD Sed for Microsoft Windows
-----------------------------

Easiest to build from the command line, using NMake:

    nmake                   # default build all
    nmake clean

Instructions for using the Microsoft C++ toolset from the command line
can be found here:
https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170

Refer to the FreeBSD manual page for instructions on how to use sed
(copy in file 'sed.txt').



Original source code and summary of changes
-------------------------------------------

FreeBSD:    https://github.com/freebsd/freebsd-src
Other:      https://www.cl.cam.ac.uk/~mgk25/ucs/wcwidth.c

Note that there has been limited testing of the modifications made to these
files, and errors have likely been introduced. It is recommended that you
thoroughly test the software, especially if you're processing non-ASCII
characters (including UTF-8 outside the wide character range).

Support for options '-i' and '-I' (in-place editing) has been removed.

