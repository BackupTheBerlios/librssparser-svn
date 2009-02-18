/*
 * =====================================================================================
 *
 *       Filename:  rss_expat.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  24.12.2008 11:25:43 CET
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *        Company:  
 *
 * =====================================================================================
 */

#include "rss.h"
#include "rss_expat.h"
#include "rss_list.h"
#include "rss_iconv.h"
#include "rss_options.h"

#include <stdlib.h>
#include <string.h>
#include <expat.h>
#include <iconv.h>
#include <ctype.h>

extern struct opt parser_options;

XML_Parser RSS_parser;

int item = 0;

struct item_data
{
	size_t title_size;
	char *title;
	size_t link_size;
	char *link;
	size_t description_size;
	char *description;
};

static void xml_stop_item_handler(void *user_data, const XML_Char *s, int len);
static void xml_start_item_handler(void *user_data, const XML_Char *s, int len);

// Set data on item start to 0
void xml_start_item_handler(void *user_data, const XML_Char *s, int len)
{
	struct item_data *item_data_ptr = malloc(sizeof(struct item_data));

	item_data_ptr->title_size = 0;
	item_data_ptr->title = NULL;

	item_data_ptr->link_size = 0;
	item_data_ptr->link = NULL;

	item_data_ptr->description_size = 0;
	item_data_ptr->description = NULL;

	(void)user_data;
	(void)s;
	(void)len;

	// Set my data for handlers
	XML_SetUserData(RSS_parser, item_data_ptr);

	// We are now inside item tag - read to parse title, link etc.
	item = 1;
}

void xml_stop_item_handler(void *user_data, const XML_Char *s, int len)
{
	struct item_data *item_data_ptr = user_data;

	// End of parsing, save data to linked list
	add_rss_data(item_data_ptr->title, item_data_ptr->link, item_data_ptr->description);

	// Free data
	free(item_data_ptr->title);
	free(item_data_ptr->link);
	free(item_data_ptr->description);

	item_data_ptr->title = NULL;
	item_data_ptr->title_size = 0;

	item_data_ptr->link = NULL;
	item_data_ptr->link_size = 0;

	item_data_ptr->description = NULL;
	item_data_ptr->description_size = 0;


	free(item_data_ptr);
	item_data_ptr = NULL;

	(void)user_data;
	(void)s;
	(void)len;

	XML_SetUserData(RSS_parser, 0);
	
	// We are now outside item tag, don't parse title, link etc.
	item = 0;
}

// Parse title data
void xml_title_handler(void *user_data, const XML_Char *s, int len)
{
	size_t x;
	char *tmp = NULL;

	struct item_data *item_data_ptr = user_data;

	// Data may by split across calls
	if (item_data_ptr->title_size == 0)
	{
		tmp = realloc(item_data_ptr->title, len+1);

		for (x = 0; x < (size_t)len; x++)
			tmp[x] = s[x];

		tmp[x] = '\0';

		// Save new pointer
		item_data_ptr->title = tmp;

		item_data_ptr->title_size += len+1;
	}
	else // Next call, add data
	{
		int z = 0;

		tmp = realloc(item_data_ptr->title, item_data_ptr->title_size+len);

		for (x = item_data_ptr->title_size-1; x < item_data_ptr->title_size+(size_t)len-1; x++)
		{
			tmp[x] = s[z];
			z++;
		}
		tmp[x] = '\0';

		// Save new pointer
		item_data_ptr->title = tmp;

		item_data_ptr->title_size += len;
	}
}

// Parse link data
void xml_link_handler(void *user_data, const XML_Char *s, int len)
{
	size_t x;
	char *tmp = NULL;

	struct item_data *item_data_ptr = user_data;

	// Data may by split across calls
	if (item_data_ptr->link_size == 0)
	{
		tmp = realloc(item_data_ptr->link, len+1);
		
		for (x = 0; x < (size_t)len; x++)
			tmp[x] = s[x];

		tmp[x] = '\0';

		// Save new pointer
		item_data_ptr->link = tmp;

		item_data_ptr->link_size += len+1;
	}
	else // Next call, add data
	{
		int z = 0;

		tmp = realloc(item_data_ptr->link, item_data_ptr->link_size+len);

		for (x = item_data_ptr->link_size-1; x < item_data_ptr->link_size+(size_t)len-1; x++)
		{
			tmp[x] = s[z];
			z++;
		}
		tmp[x] = '\0';
	
		// Save new pointer
		item_data_ptr->link = tmp;

		item_data_ptr->link_size += len;
	}
}

// Parse description data
void xml_description_handler(void *user_data, const XML_Char *s, int len)
{
	size_t x;
	char *tmp = NULL;

	struct item_data *item_data_ptr = user_data;

	// Data may by split across calls
	if (item_data_ptr->description_size == 0)
	{
		tmp = realloc(item_data_ptr->description, len+1);

		for (x = 0; x < (size_t)len; x++)
			tmp[x] = s[x];

		tmp[x] = '\0';

		// Save new pointer
		item_data_ptr->description = tmp;

		item_data_ptr->description_size += len+1;
	}
	else // Next call, add data
	{
		int z = 0;

		tmp = realloc(item_data_ptr->description, item_data_ptr->description_size+len);

		for (x = item_data_ptr->description_size-1; x < item_data_ptr->description_size+(size_t)len-1; x++)
		{
			tmp[x] = s[z];
			z++;
		}
		tmp[x] = '\0';
	
		// Save new pointer
		item_data_ptr->description = tmp;

		item_data_ptr->description_size += len;
	}
}

// Set start handler for tags
void xml_start_handler(void *user_data, const XML_Char *name, const XML_Char **atts)   
{
	// Parse title, link, etc. ony if inside item tag
	if (item == 1)
	{
		// Does user want title on linked-list?
		if (parser_options.linked_list & LLHAVETITLE)
		{
			if (strcmp(name, "title") == 0)
				XML_SetCharacterDataHandler(RSS_parser, xml_title_handler);
		}

		// Does user want title on linked-list?
		if (parser_options.linked_list & LLHAVELINK)
		{
			if (strcmp(name, "link") == 0)
				XML_SetCharacterDataHandler(RSS_parser, xml_link_handler);
		}

		// Does user want description on linked-list?
		if (parser_options.linked_list & LLHAVEDESCRIPTION)
		{	
			if (strcmp(name, "description") == 0)
			XML_SetCharacterDataHandler(RSS_parser, xml_description_handler);
		}
	}

	// Item starts here - run handler
	if (strcmp(name, "item") == 0)
		xml_start_item_handler(XML_GetUserData(RSS_parser), NULL, 0);

	(void)user_data;
	(void)atts;
}

// Set stop handlers
void xml_stop_handler(void *user_data, const XML_Char *name)
{
	if (strcmp(name, "title") == 0)
		XML_SetCharacterDataHandler(RSS_parser, 0);
	
	if (strcmp(name, "link") == 0)
		XML_SetCharacterDataHandler(RSS_parser, 0);

	if (strcmp(name, "description") == 0)
		XML_SetCharacterDataHandler(RSS_parser, 0);

	if ((strcmp(name, "item") == 0) && (item == 1))
		xml_stop_item_handler(XML_GetUserData(RSS_parser), NULL, 0);

	(void)user_data;
}

// Parse raw rss data with expat
int rss_parse_data(RSS_data_t *RSS_data)
{
	RSS_parser = NULL;

	if ((RSS_parser = XML_ParserCreate("UTF-8")) == NULL)
	{
#ifdef DEBUG
		fprintf (stderr, "XML_ParserCreate(): fail\n");
#endif
		return -1;
	}
	
	XML_SetElementHandler(RSS_parser, xml_start_handler, xml_stop_handler);
	
	if (data_to_utf8(RSS_data) == -1)
	{
#ifdef DEBUG
		fprintf (stderr, "data_to_utf8(): fail\n");
#endif
		XML_ParserFree(RSS_parser);
		return -2;
	}

	// Parse raw rss data
	if (XML_Parse(RSS_parser, RSS_data->data, RSS_data->data_size-1, 1) == 0) 
	{
#ifdef DEBUG
		fprintf (stderr, "XML_Parse(): fail\n");
		fprintf (stderr, "%s\n", XML_ErrorString(XML_GetErrorCode(RSS_parser)));
#endif
		XML_ParserFree(RSS_parser);
		return -3;
	}

	XML_ParserFree(RSS_parser);

	return 0;
}
