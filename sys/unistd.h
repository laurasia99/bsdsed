/* Extract */
int	 getopt(int, char * const [], const char *);

extern char *optarg;			/* getopt(3) external variables */
extern int optind, opterr, optopt;

#define	STDIN_FILENO	0	/* standard input file descriptor */
#define	STDOUT_FILENO	1	/* standard output file descriptor */
#define	STDERR_FILENO	2	/* standard error file descriptor */

int getline(char ** linep, size_t * linecapp, FILE * fp);
