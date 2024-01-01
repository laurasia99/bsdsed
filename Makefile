O = obj
S = .
CC = cl
CFLAGS = /nologo /O2 /D_CRT_SECURE_NO_WARNINGS /I. /Isys /W3
LDFLAGS = /nologo
# Note regex\engine.c included by other files
OBJS = $O\compile.obj $O\main.obj $O\misc.obj $O\process.obj \
    $O\regcomp.obj $O\regerror.obj $O\regexec.obj $O\regfree.obj \
    $O\err.obj $O\getopt.obj $O\reallocarray.obj \
    $O\getline.obj $O\wcwidth.obj

all: sed.exe
sed.exe: $(OBJS)
	$(CC) /Fe:$@ $(OBJS) $(LDFLAGS)
clean:
	-del /Q $(OBJS) sed.exe

#
$O:
    if not exist $O mkdir $O
$O\compile.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c
$O\main.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c
$O\misc.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c
$O\process.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c

# Originally FreeBSD standard C libary
$O\err.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c
$O\getdelim.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c
$O\getline.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c
$O\getopt.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c
$O\wcwidth.obj: $O $S\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\$(@B).c

$O\regcomp.obj: $O $S\regex\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\regex\$(@B).c
$O\regerror.obj: $O $S\regex\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\regex\$(@B).c
$O\regexec.obj: $O $S\regex\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\regex\$(@B).c
$O\regfree.obj: $O $S\regex\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\regex\$(@B).c

# Only used by regex code (from C library)
$O\reallocarray.obj: $O $S\regex\$(@B).c
	$(CC) /c /Fo:$@ $(CFLAGS) $S\regex\$(@B).c
