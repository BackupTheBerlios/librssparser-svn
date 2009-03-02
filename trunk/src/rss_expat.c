/*
 * =====================================================================================
 *
 *       Filename:  rss_expat.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  24.12.2008 11:25:43 CET
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *
 * =====================================================================================
 */

#include "rss.h"
#include "rss_expat.h"
#include "rss_list.h"
#include "rss_iconv.h"
#include "rss_options.h"
#include "rss_clean.h"

#include <stdlib.h>
#include <string.h>
#include <expat.h>
#include <iconv.h>
#include <ctype.h>

extern struct opt parser_options;

XML_Parser RSS_parser;

// TODO do it better !
int item = 0;

static void xml_start_item_handler(void *user_data, const XML_Char *s, int len);
static void xml_stop_item_handler(void *user_data, const XML_Char *s, int len);

static void xml_title_handler(void *user_data, const XML_Char *s, int len);
static void xml_link_handler(void *user_data, const XML_Char *s, int len);
static void xml_description_handler(void *user_data, const XML_Char *s, int len);
static void xml_pubdate_handler(void *user_data, const XML_Char *s, int len);

// Set data on item start to 0
void xml_start_item_handler(void *user_data, const XML_Char *s, int len)
{
	struct item_data *item_data_ptr = malloc(sizeof(struct item_data));

	item_data_ptr->title_size = 0;
	item_data_ptr->title = NULL;

	item_data_ptr->link_size = 0;
	

	item_data_ptr->description_size = 0;
	item_data_ptr->description = NULL;

	item_data_ptr->pubdate_size = 0;
	item_data_ptr->pubdate = NULL;

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

	// Need to clean up data?
	if (parser_options.linked_list_data != 0)
		clean_linked_list_data(item_data_ptr);

	// End of parsing, save data to linked list
	if (add_rss_data(item_data_ptr) == -1)
	{
#ifdef DEBUG
		fprintf(stderr, "add_rss_data(): fail\n");
#endif
		return;
	}

	// Free data
	free(item_data_ptr->title);
	free(item_data_ptr->link);
	free(item_data_ptr->description);
	free(item_data_ptr->pubdate);

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
	int x;
	char *tmp = NULL;
	char *tmp_ptr = tmp;

	struct item_data *item_data_ptr = user_data;

	// Data may by split across calls
	if (item_data_ptr->title_size == 0)
	{
		tmp_ptr = tmp = malloc(len+1);

		x = 0;
		while(x != len)
		{
			*tmp++ = *s++;
			x++;
		}
		*tmp = '\0';

		// Save new pointer
		item_data_ptr->title = tmp_ptr;

		item_data_ptr->title_size += len+1;
	}
	else // Next call, add data
	{
		x = 0;

		tmp_ptr = tmp = realloc(item_data_ptr->title, item_data_ptr->title_size+len);

		tmp += item_data_ptr->title_size-1;

		while(x != len)
		{
			*tmp++ = *s++;
			x++;
		}

		*tmp = '\0';

		// Save new pointer
		item_data_ptr->title = tmp_ptr;

		item_data_ptr->title_size += len;
	}
}

// Parse link data
void xml_link_handler(void *user_data, const XML_Char *s, int len)
{
	int x;
	char *tmp = NULL;
	char *tmp_ptr = tmp;

	struct item_data *item_data_ptr = user_data;

	// Data may by split across calls
	if (item_data_ptr->link_size == 0)
	{
		tmp_ptr = tmp = malloc(len+1);

		x = 0;
		while(x != len)
		{
			*tmp++ = *s++;
			x++;
		}
		*tmp = '\0';

		// Save new pointer
		item_data_ptr->link = tmp_ptr;

		item_data_ptr->link_size += len+1;
	}
	else // Next call, add data
	{
		x = 0;

		tmp_ptr = tmp = realloc(item_data_ptr->link, item_data_ptr->link_size+len);

		tmp += item_data_ptr->link_size-1;

		while(x != len)
		{
			*tmp++ = *s++;
			x++;
		}

		*tmp = '\0';
	
		// Save new pointer
		item_data_ptr->link = tmp_ptr;

		item_data_ptr->link_size += len;
	}
}

// Parse description data
void xml_description_handler(void *user_data, const XML_Char *s, int len)
{
	int x;
	char *tmp = NULL;
	char *tmp_ptr = tmp;

	struct item_data *item_data_ptr = user_data;

	// Data may by split across calls
	if (item_data_ptr->description_size == 0)
	{
		tmp_ptr = tmp = malloc(len+1);

		x = 0;
		while(x != len)
		{
			*tmp++ = *s++;
			x++;
		}
		*tmp = '\0';

		// Save new pointer
		item_data_ptr->description = tmp_ptr;

		item_data_ptr->description_size += len+1;
	}
	else // Next call, add data
	{
		x = 0;

		tmp_ptr = tmp = realloc(item_data_ptr->description, item_data_ptr->description_size+len);

		tmp += item_data_ptr->description_size-1;

		while(x != len)
		{
			*tmp++ = *s++;
			x++;
		}

		*tmp = '\0';

		// Save new pointer
		item_data_ptr->description = tmp_ptr;

		item_data_ptr->description_size += len;
	}
}

// Parse pubDate data
void xml_pubdate_handler(void *user_data, const XML_Char *s, int len)
{
	int x;
	char *tmp = NULL;
	char *tmp_ptr = tmp;

	struct item_data *item_data_ptr = user_data;

	// Data may by split across calls
	if (item_data_ptr->pubdate_size == 0)
	{
		tmp_ptr = tmp = malloc(len+1);

		x = 0;
		while(x != len)
		{
			*tmp++ = *s++;
			x++;
		}
		*tmp = '\0';

		// Save new pointer
		item_data_ptr->pubdate = tmp_ptr;

		item_data_ptr->pubdate_size += len+1;
	}
	else // Next call, add data
	{
		x = 0;

		tmp_ptr = tmp = realloc(item_data_ptr->pubdate, item_data_ptr->pubdate_size+len);

		tmp += item_data_ptr->pubdate_size-1;

		while(x != len)
		{
			*tmp++ = *s++;
			x++;
		}

		*tmp = '\0';
	
		// Save new pointer
		item_data_ptr->pubdate = tmp_ptr;

		item_data_ptr->pubdate_size += len;
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
	
		// Does user want pubDate on linked-list?
		if (parser_options.linked_list & LLHAVEPUBDATE)
		{	
			if (strcmp(name, "pubDate") == 0)
				XML_SetCharacterDataHandler(RSS_parser, xml_pubdate_handler);
		}
	}

	// Item starts here - run handler
	if (strcmp(name, "item") == 0)
		xml_start_item_handler(NULL, NULL, 0);

	(void)user_data;
	(void)atts;
}

// Set stop handlers
void xml_stop_handler(void *user_data, const XML_Char *name)
{
	// If this is item and tag run handler
	if ((strcmp(name, "item") == 0) && (item == 1))
		xml_stop_item_handler(XML_GetUserData(RSS_parser), NULL, 0);

	// Else set data handler to NULL
	XML_SetCharacterDataHandler(RSS_parser, 0);

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
