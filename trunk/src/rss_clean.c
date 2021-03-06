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

#include <stdio.h>
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
// Remove double, triple, ect. spaces inside of string
char *rm_spaces(char *buf)
{
	size_t len = 0;
	char *last = NULL;
	char *ptr = NULL;
	
	if (buf == NULL)
		return NULL;

	while(isspace((int)*buf) != 0)
		buf++;

	len = strlen(buf);

	ptr = buf; // save pointer

	last = buf + (len - 1);

	while((isspace((int)*last) != 0) && (len != 0))
	{
		len--;
		last--;
	}
	*(last+1) = '\0';

	last = ptr;

	// Remove double, triple... spaces inside of string
	while(*ptr != '\0')
	{
		*last = *ptr;
		last++;

		if(isspace(*ptr))
		{
			while(isspace(*ptr))
				ptr++;
		}
		else
			ptr++;
	}
	*last = '\0';

	return buf;
}

// Find and replace
char *replace(char *whole_line)
{
	char *in_line = strdup(whole_line);
	char *in_line_ptr = in_line;

	const char *new = NULL;
	const char *old = NULL;

	char *sr = NULL;
	char *ret = NULL;

	size_t markup_pos = 0;
	size_t i = 0;

	size_t linelen = 0;
	size_t newlen = 0;
	size_t oldlen = 0;
	int margin = 0;

	size_t html_markup_size = (sizeof(html_markup) / sizeof(char *));

	for (markup_pos = 0; markup_pos < html_markup_size; markup_pos++)
	{
		new = html_ascii[markup_pos];
		old = html_markup[markup_pos];

		i = 0;

		linelen = strlen(in_line);
		
		newlen = strlen(new);
		oldlen = strlen(old);
		
		margin = (int)linelen - (int)oldlen;

		if (margin <= 0)
			continue;

		sr = ret = malloc(linelen + 1); // newlen is always < oldlen

		*sr = '\0';

		// Find and replace
		while (i <= (unsigned int)(margin-1))
		{
			if (strncmp(in_line, old, oldlen) == 0)
			{
				strncpy(sr, new, newlen);

				in_line += oldlen;
				sr += newlen;
				i += oldlen;
			}
			else
			{
				*sr++ = *in_line++;
				i++;
			}
		}

		if (strncmp(in_line, old, oldlen) != 0)
		{
			while(*in_line != '\0')
				*sr++ = *in_line++;
		}
		else
		{
			strncpy(sr, new, newlen);
			sr += newlen;
		}

		*sr = '\0';

		free(in_line_ptr);
		in_line = strdup(ret);
		in_line_ptr = in_line;

		free(ret);
	}
	return in_line_ptr;
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

// Clear control characters
int clear_cch(struct item_data *item_data_ptr)
{
	char *tmp = NULL;
	char *new = NULL;
	char *tmp_ptr = NULL;
	char *new_ptr = NULL;

	if ((tmp = item_data_ptr->title) != NULL)
	{
		tmp_ptr = tmp;
		if((new_ptr = new = malloc(item_data_ptr->title_size)) == NULL)	// save new space
			return -1;

		while(*tmp != '\0') // Don't delete '\0' !
		{
			if (!iscntrl(*tmp))
			{
				*new++ = *tmp++;
			}
			else
				tmp++;
		}
		*new = '\0';

		free(item_data_ptr->title);
		item_data_ptr->title = new_ptr;
		item_data_ptr->title_size = strlen(new_ptr);
	}

	if ((tmp = item_data_ptr->link) != NULL)
	{
		tmp_ptr = tmp;
		new_ptr = new = malloc(item_data_ptr->link_size);

		while(*tmp != '\0') // Don't delete '\0' !
		{
			if (!iscntrl(*tmp))
			{
				*new++ = *tmp++;
			}
			else
				tmp++;
		}
		*new = '\0';

		free(item_data_ptr->link);
		item_data_ptr->link = new_ptr;
		item_data_ptr->link_size = strlen(new_ptr);
	}

	if ((tmp = item_data_ptr->description) != NULL)
	{
		tmp_ptr = tmp;
		if ((new_ptr = new = malloc(item_data_ptr->description_size)) == NULL)
			return -1;

		while(*tmp != '\0') // Don't delete '\0' !
		{
			if (!iscntrl(*tmp))
			{
				*new++ = *tmp++;
			}
			else
				tmp++;
		}
		*new = '\0';

		free(item_data_ptr->description);
		item_data_ptr->description = new_ptr;
		item_data_ptr->description_size = strlen(new_ptr);
	}

	if ((tmp = item_data_ptr->pubdate) != NULL)
	{
		tmp_ptr = tmp;
		if ((new_ptr = new = malloc(item_data_ptr->pubdate_size)) == NULL)
			return -1;

		while(*tmp != '\0') // Don't delete '\0' !
		{
			if (!iscntrl(*tmp))
			{
				*new++ = *tmp++;
			}
			else
				tmp++;
		}
		*new = '\0';

		free(item_data_ptr->pubdate);
		item_data_ptr->pubdate = new_ptr;
		item_data_ptr->pubdate_size = strlen(new_ptr);
	}

	return 0;
}

char *clear_html(char *data, size_t *out_size)
{
	char *ret = NULL;
	char *tmp = NULL;
	char *ptr = NULL;
	size_t new_size = 0;

	if ((tmp = data) != NULL)
	{
		new_size = count_no_html_size(tmp);
		ptr = ret = malloc(new_size+1);
		tmp = data;
		save_no_html_string(ptr, tmp);

		// Replace HTML markup code
		if ((tmp = replace(ptr)) != NULL)
		{
			free(ret);

			ret = strdup(rm_spaces(tmp));
			*out_size = strlen(ret);

			free(tmp);

			return ret;
		}
		else
			free(ptr);
	}

	return NULL;
}

// Clean data on linked-list as user wants
int clean_linked_list_data(struct item_data *item_data_ptr)
{
	// Clear control characters
	if (parser_options.linked_list_data & LLDATACLEARCCH)
	{
		if(clear_cch(item_data_ptr) == -1)
		{
			fprintf(stderr, "clear_cch(): fail\n");
			return -1;
		}
	}

	// Clear html tags
	if (parser_options.linked_list_data & LLDATACLEARHTML)
	{
		char *no_html_title = NULL;
		char *no_html_link = NULL;
		char *no_html_pubdate = NULL;
		char *no_html_description = NULL;

		size_t new_size = 0;

		if ((no_html_title = clear_html(item_data_ptr->title, &new_size)) != NULL)
		{
			free(item_data_ptr->title);

			item_data_ptr->title = no_html_title;
			item_data_ptr->title_size = new_size;

		}
		
		if ((no_html_link = clear_html(item_data_ptr->link, &new_size)) != NULL)
		{
			free(item_data_ptr->link);

			item_data_ptr->link = no_html_link;
			item_data_ptr->link_size = new_size;
		}

		if ((no_html_pubdate = clear_html(item_data_ptr->pubdate, &new_size)) != NULL)
		{
			free(item_data_ptr->pubdate);

			item_data_ptr->pubdate = no_html_pubdate;
			item_data_ptr->pubdate_size = new_size;
		}

		if ((no_html_description = clear_html(item_data_ptr->description, &new_size)) != NULL)
		{
			free(item_data_ptr->description);

			item_data_ptr->description = no_html_description;
			item_data_ptr->description_size = new_size;
		}
	}

	return 0;
}
