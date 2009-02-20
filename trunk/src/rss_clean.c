/*
 * =====================================================================================
 *
 *       Filename:  rss_clean.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  19.02.2009 19:11:57 CET
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *
 * =====================================================================================
 */

#include <ctype.h>
#include <string.h>

#include "rss_clean.h"
#include "rss_options.h"

extern struct opt parser_options;

char *html_markup[] =
{
	"&amp;",	/* ampersand  & */
	"&quot;",	/* quotation mark " */
	"&lt;",		/* less-than sign < */
	"&gt;",		/* greater-than sign > */
	"&nbsp;",	/* no-break space  */
	"&copy;",	/* copyright sign (C) */
	"&ldquo;",	/* left double quotation mark " */
	"&rdquo;",	/* right double quotation mark " */
	"&sbquo;",	/* single low-9 quotation mark " */
	"&bdquo;",	/* double low-9 quotation mark " */
	"&ndash;",	/* en dash - */

	"&#38;",	/* ampersand  & */
	"&#34;",	/* quotation mark " */
	"&#60;",	/* less-than sign < */
	"&#62;",	/* greater-than sign > */
	"&#8220;",	/* quotation mark " */
	"&#8221;",	/* quotation mark " */
	"&#8218;",	/* quotation mark " */
	"&#8222;",	/* quotation mark " */
	"&#8211;",	/* en dash - */
	"&#39;",	/* apostrophe ' */
};

char *html_ascii[] =
{
	"&",	/* &amp; */
	"\"",	/* &quot; */
	"<",	/* &lt; */
	">",	/* &gt; */
	" ",	/* &nbsp; */
	"(C)",	/* &copy; */
	"\"",	/* &ldquo; */
	"\"",	/* &rdquo; */
	"\"",	/* &sbquo; */
	"\"",	/* &bdquo; */
	"-",	/* &ndash; */
        
	"&",	/* &#38; */
	"\"",	/* &#34; */
	"<",	/* &#60; */
	">",	/* &#62; */
	"\"",	/* &#8220; */
	"\"",	/* &#8221; */
	"\"",	/* &#8218; */
	"\"",	/* &#8222; */
	"-",	/* &#8211; */
	"\'",	/* &#39; */
};      

// Remove spaces at beginning and end of string
char *rm_spaces(char *buf)
{
	size_t len = 0;
	char *last = 0;

	if (buf == NULL)
		return NULL;

	while(isspace((int)*buf) != 0)
		buf++;

	len = strlen(buf);

	last = buf + (len - 1);

	while((isspace((int)*last) != 0) && (len != 0))
	{
		len--;
		last--;
	}
	*(last+1) = '\0';

	return buf;
}

// Find and replace
char *replace(const char *whole_line, const char *old, const char *new)
{
char *sr = NULL, *ret = NULL;
size_t i = 0;
size_t count = 0;

size_t linelen = strlen(whole_line);
size_t newlen = strlen(new);
size_t oldlen = strlen(old);
int margin = (int)linelen-(int)oldlen;

if (margin <= 0)
	return NULL;

/*
 * Count memory needed
 */
if (newlen != oldlen)
{
	for (i = 0; i < (unsigned int)(margin+1); )
	{
		if (strncmp(&whole_line[i], old, oldlen) == 0)
		{
			count++;
			i += oldlen;
		}
		else
			i++;
	}
}
else
	i = linelen;

if (linelen == i)
	ret = malloc(i + 1 + count * (newlen - oldlen));
else
	ret = malloc(i + oldlen + count * (newlen - oldlen));

sr = ret;
i = 0;

/*
 * Find and replace
 */
while (i <= (unsigned int)(margin-1))
{
	if (strncmp(whole_line, old, oldlen) == 0)
	{
		strncpy(sr, new, newlen);

		whole_line  += oldlen;
		sr += newlen;
		i += oldlen;
	}
	else
	{
		*sr++ = *whole_line++;
		i++;
	}
}

if (strncmp(whole_line, old, oldlen) != 0)
{
	while(i != linelen)
	{
		*sr++ = *whole_line++;
		i++;
	}
}
else
{
	strncpy(sr, new, newlen);

	sr += newlen;
	whole_line  += oldlen;
}

*sr = '\0';	/* String */

return ret;
}

// Count string size without html tags
size_t count_no_html_size(char *ptr)
{
	size_t new_size = 0;
	int in_html = 0;

	while(*ptr != 0) 
	{
		if (*ptr == '<')
		{
			in_html = 1;
			ptr++;
			continue;
		}

		if (*ptr == '>')
		{
			in_html = 0;
			ptr++;
			continue;
		}

		if (in_html == 0)
			new_size++;

		ptr++;
	}

	return new_size;
}

// Save string without html tags
void save_no_html_string(char *to, char *from)
{
	int in_html = 0;

	while(*from != 0)
	{
		if (*from == '<')
		{
			in_html = 1;
			from++;
			continue;
		}

		if (*from == '>')
		{
			in_html = 0;
			from++;
			continue;
		}

		if (in_html == 0)
		{
			*to = *from;
			to++;
		}

		from++;
	}
	*to = '\0';
}

// Clean data on linked-list as user wants
void clean_linked_list_data(struct item_data *item_data_ptr)
{
	char *tmp = NULL;

	// Clear control characters
	if (parser_options.linked_list_data & LLDATACLEARCCH)
	{
		if ((tmp = item_data_ptr->title) != NULL)
		{
			while(*tmp != 0) // Don't delete '\0' !
			{
				if (iscntrl(*tmp))
					*tmp = ' ';
				tmp++;
			}
		}

		if ((tmp = item_data_ptr->link) != NULL)
		{
			while(*tmp != 0)
			{
				if (iscntrl(*tmp))
					*tmp = ' ';
				tmp++;
			}
		}

		if ((tmp = item_data_ptr->description) != NULL)
		{
			while(*tmp != 0)
			{
				if (iscntrl(*tmp))
					*tmp = ' ';
				tmp++;
			}
		}

		if ((tmp = item_data_ptr->pubdate) != NULL)
		{
			while(*tmp != 0)
			{
				if (iscntrl(*tmp))
					*tmp = ' ';
				tmp++;
			}
		}
	}
	
	// Clear html tags
	if (parser_options.linked_list_data & LLDATACLEARHTML)
	{
		char *no_html_title = NULL;
		char *no_html_link = NULL;
		char *no_html_pubdate = NULL;
		char *no_html_description = NULL;
		char *ptr = NULL;

		size_t new_size = 0;
		size_t markup_pos = 0;

		if ((tmp = item_data_ptr->title) != NULL)
		{
			new_size = count_no_html_size(tmp);
			
			ptr = no_html_title = malloc(new_size+1);

			tmp = item_data_ptr->title;

			save_no_html_string(ptr, tmp);

			// Replace HTML markup code
			for (markup_pos = 0; markup_pos < (sizeof(html_markup) / sizeof(char *)); markup_pos++)
			{
		        if ((tmp = replace(ptr, html_markup[markup_pos], html_ascii[markup_pos])) != NULL)
        		{
					free(ptr);
					ptr = strdup(tmp);
					free(tmp);
				}
			}
			free(item_data_ptr->title);

			item_data_ptr->title = strdup(rm_spaces(ptr));
			item_data_ptr->title_size = strlen(item_data_ptr->title);

			free(ptr);
		}

		if ((tmp = item_data_ptr->link) != NULL)
		{
			new_size = count_no_html_size(tmp);

			ptr = no_html_link = malloc(new_size+1);

			tmp = item_data_ptr->link;

			save_no_html_string(ptr, tmp);

			// Replace HTML markup code
			for (markup_pos = 0; markup_pos < (sizeof(html_markup) / sizeof(char *)); markup_pos++)
			{
		        if ((tmp = replace(ptr, html_markup[markup_pos], html_ascii[markup_pos])) != NULL)
        		{
					free(ptr);
					ptr = strdup(tmp);
					free(tmp);
				}
			}
			free(item_data_ptr->link);

			item_data_ptr->link = strdup(rm_spaces(ptr));
			item_data_ptr->link_size = strlen(item_data_ptr->link);

			free(ptr);
		}

		if ((tmp = item_data_ptr->pubdate) != NULL)
		{
			new_size = count_no_html_size(tmp);
			
			ptr = no_html_pubdate = malloc(new_size+1);

			tmp = item_data_ptr->pubdate;

			save_no_html_string(ptr, tmp);

			// Replace HTML markup code
			for (markup_pos = 0; markup_pos < (sizeof(html_markup) / sizeof(char *)); markup_pos++)
			{
		        if ((tmp = replace(ptr, html_markup[markup_pos], html_ascii[markup_pos])) != NULL)
        		{
					free(ptr);
					ptr = strdup(tmp);
					free(tmp);
				}
			}
			free(item_data_ptr->pubdate);

			item_data_ptr->pubdate = strdup(rm_spaces(ptr));
			item_data_ptr->pubdate_size = strlen(item_data_ptr->pubdate);

			free(ptr);
		}

		if ((tmp = item_data_ptr->description) != NULL)
		{
			new_size = count_no_html_size(tmp);

			ptr = no_html_description = malloc(new_size+1);

			tmp = item_data_ptr->description;

			save_no_html_string(ptr, tmp);

			// Replace HTML markup code
			for (markup_pos = 0; markup_pos < (sizeof(html_markup) / sizeof(char *)); markup_pos++)
			{
		        if ((tmp = replace(ptr, html_markup[markup_pos], html_ascii[markup_pos])) != NULL)
        		{
					free(ptr);
					ptr = strdup(tmp);
					free(tmp);
				}
			}
			
			free(item_data_ptr->description);

			item_data_ptr->description = strdup(rm_spaces(ptr));
			item_data_ptr->description_size = strlen(item_data_ptr->description);

			free(ptr);
		}		
	}
}
