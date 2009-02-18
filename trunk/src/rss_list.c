/*
 * =====================================================================================
 *
 *       Filename:  rss_list.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  24.12.2008 12:26:33 CET
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *        Company:  
 *
 * =====================================================================================
 */

#include <stdlib.h>
#include <string.h>

#include "rss.h"
#include "rss_list.h"

// Add title, link, etc to list
void add_rss_data(const char *title, const char *link, const char *description, const char *pubdate)
{
	// First element
	if (list_head.first == NULL)
	{
		list_head.first = malloc(sizeof(struct RSS_item_t));

		list_head.last = list_head.first;

		list_head.first->item_number = 1;
	
		if(title != NULL)
			list_head.first->title = strdup(title);
		else
			list_head.first->title = NULL;
	
		if(link != NULL)
			list_head.first->link = strdup(link);
		else
			list_head.first->link = NULL;
	
		if (description != NULL)
			list_head.first->description = strdup(description);
		else
			list_head.first->description = NULL;

		if (pubdate != NULL)
			list_head.first->pubdate = strdup(pubdate);
		else
			list_head.first->pubdate = NULL;

	
		list_head.first->next_item = NULL;
	}
	else // Next elements
	{
		struct RSS_item_t *prev = list_head.last;

		list_head.last->next_item = malloc(sizeof(struct RSS_item_t));

		list_head.last = list_head.last->next_item;

		list_head.last->item_number = prev->item_number + 1;
	
		if (title != NULL)
			list_head.last->title = strdup(title);
		else
			list_head.last->title = NULL;
	
		if (link != NULL)
			list_head.last->link = strdup(link);
		else
			list_head.last->link = NULL;
	
		if (description != NULL)
			list_head.last->description = strdup(description);
		else
			list_head.last->description = NULL;

		if (pubdate != NULL)
			list_head.last->pubdate = strdup(pubdate);
		else
			list_head.last->pubdate = NULL;

		list_head.last->next_item = NULL;
	}
}

// Free user list
void free_rss_list(struct RSS_item_t *RSS_item_list)
{
	// This is not my list !
	if (RSS_item_list != list_head.first)
		return;

	while(list_head.first != NULL)
	{
		struct RSS_item_t *tmp = list_head.first->next_item;

		free(list_head.first->title);
		free(list_head.first->link);
		free(list_head.first->description);
		free(list_head.first->pubdate);

		free(list_head.first);

		list_head.first = tmp;
	}
}
