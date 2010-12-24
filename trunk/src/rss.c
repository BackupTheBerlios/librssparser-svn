/*
 * =====================================================================================
 *
 *       Filename:  rss.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  23.12.2008 15:06:17 CET
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *
 * =====================================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <expat.h>

#include "rss.h"
#include "rss_expat.h"
#include "rss_list.h"
#include "rss_data.h"
#include "rss_options.h"

RSS_data_t *RSS_data = NULL;

// Set default values
struct opt parser_options = {
	// linked_list
	LLHAVETITLE | LLHAVELINK | LLHAVEDESCRIPTION | LLHAVEPUBDATE,

	// linked-list data
	LLDATACLEARCCH
};

static int save_rss_data(char *input_data);
static void free_rss_data(void);

// Save raw data to our struct
int save_rss_data(char *input_data)
{
	RSS_data = malloc(sizeof(RSS_data_t));

	if (RSS_data != NULL)
	{
		if ((RSS_data->data = strdup(input_data)) == NULL)
			return -1;

		if ((RSS_data->data_size = strlen(input_data)) == NULL)
			return -1;

		return 0;	// malloc sucess
	}
	else
		return -1;	// malloc fail
}

// Free struct with raw data
void free_rss_data(void)
{
	if (RSS_data != NULL)
	{
		free(RSS_data->data);
		free(RSS_data);
	}
}

// Return list to user with parsed rss data
struct RSS_item_t *rss_fetch(char *input_data)
{
	struct RSS_item_t *RSS_item_list = NULL;
	list_head.first = list_head.last = RSS_item_list;	// start list

	// Save user input
	if (save_rss_data(input_data) == -1)
	{
		fprintf (stderr, "save_rss_data(): fail\n");
		free_rss_data();
	
		return NULL;
	}

	if (rss_parse_data(RSS_data) == -1)	// parse data
	{
		fprintf (stderr, "rss_parse_data(): fail\n");
		free_rss_data();

		return NULL;
	}

	free_rss_data();

	return list_head.first;		// return data as list
}

// Set parser options
void rss_set_opt(int opt_type, int options)
{
	switch(opt_type)
	{
		// Set options for linked-list
		case LLOPTTYPE:
			parser_options.linked_list = options;
			break;

		// Set options for data on linked-list
		case LLDATAOPTTYPE:
			parser_options.linked_list_data = options;
			break;
	}
}
