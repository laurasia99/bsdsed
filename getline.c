/* Simple (naive) implementation of getline()
 *  - NOT thread safe
 *  - Maximum line length arbitrarily imposed
 *  - Assumes text file, with no embedded NUL characters
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

#define MAXLINE     65536

int
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

	return (int)linelen;
}
