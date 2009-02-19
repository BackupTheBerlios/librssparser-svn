/*
 * =====================================================================================
 *
 *       Filename:  rss_list.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  24.12.2008 12:26:33 CET
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *
 * =====================================================================================
 */

#include <stdlib.h>
#include <string.h>

#include "rss.h"
#include "rss_list.h"

// Add title, link, etc to list
int add_rss_data(struct item_data const *item_data_ptr)
{
	// First element
	if (list_head.first == NULL)
	{
		if ((list_head.first = malloc(sizeof(struct RSS_item_t))) == NULL)
		{
#ifdef DEBUG
			fprintf (stderr, "malloc() fail\n");
#endif
			return -1;
		}

		list_head.last = list_head.first;

		list_head.first->item_number = 1;
	
		if(item_data_ptr->title != NULL)
			list_head.first->title = strdup(item_data_ptr->title);
		else
			list_head.first->title = NULL;
	
		if(item_data_ptr->link != NULL)
			list_head.first->link = strdup(item_data_ptr->link);
		else
			list_head.first->link = NULL;
	
		if (item_data_ptr->description != NULL)
			list_head.first->description = strdup(item_data_ptr->description);
		else
			list_head.first->description = NULL;

		if (item_data_ptr->pubdate != NULL)
			list_head.first->pubdate = strdup(item_data_ptr->pubdate);
		else
			list_head.first->pubdate = NULL;

	
		list_head.first->next_item = NULL;
	}
	else // Next elements
	{
		struct RSS_item_t *prev = list_head.last;

		if ((list_head.last->next_item = malloc(sizeof(struct RSS_item_t))) == NULL)
		{
#ifdef DEBUG
			fprintf (stderr, "malloc() fail\n");
#endif
			return -1;
		}

		list_head.last = list_head.last->next_item;

		list_head.last->item_number = prev->item_number + 1;
	
		if (item_data_ptr->title != NULL)
			list_head.last->title = strdup(item_data_ptr->title);
		else
			list_head.last->title = NULL;
	
		if (item_data_ptr->link != NULL)
			list_head.last->link = strdup(item_data_ptr->link);
		else
			list_head.last->link = NULL;
	
		if (item_data_ptr->description != NULL)
			list_head.last->description = strdup(item_data_ptr->description);
		else
			list_head.last->description = NULL;

		if (item_data_ptr->pubdate != NULL)
			list_head.last->pubdate = strdup(item_data_ptr->pubdate);
		else
			list_head.last->pubdate = NULL;

		list_head.last->next_item = NULL;
	}

	return 0;
}

// Free user list
int free_rss_list(struct RSS_item_t *RSS_item_list)
{
	// This is not my list !
	if (RSS_item_list != list_head.first)
		return -1;

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

	return 0;
}
