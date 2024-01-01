/* Simple (naive) implementation of getline()
 *  - NOT thread safe
 *  - Maximum line length arbitrarily imposed
 *  - Assumes text file, with no embedded NUL characters
 */

#include <sys/_types.h>
#include <sys/types.h>
#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE     65536

ssize_t
getline(char ** linep, size_t * linecapp, FILE * fp)
{
	static char buf[MAXLINE];
	size_t linelen;

	if (linep == NULL || linecapp == NULL) {
		errno = EINVAL;
		return -1;
	}

	if (*linep == NULL)
		*linecapp = 0;

	if(!fgets(buf, MAXLINE, fp))
		if(ferror(fp))
			return -1;

	linelen = strlen(buf) + 1;
	if(linelen > *linecapp) {
		if(!(*linep = realloc(*linep, linelen)))
			return -1;
		*linecapp = linelen;
	}
	memcpy(*linep, buf, linelen);

	return (ssize_t)linelen;
}
