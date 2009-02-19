/*
 * =====================================================================================
 *
 *       Filename:  rss.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  23.12.2008 15:06:17 CET
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *        Company:  
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

static int set_rss_data(char *input_data);
static void free_rss_data(void);

// Save raw data to our struct
int set_rss_data(char *input_data)
{
	RSS_data = malloc(sizeof(RSS_data_t));

	if (RSS_data != NULL)
	{
		RSS_data->data_size = 0;
		RSS_data->data = NULL;

		RSS_data->data = strdup(input_data);
		RSS_data->data_size = strlen(input_data);

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

	if (set_rss_data(input_data) == -1)
	{
#ifdef DEBUG
		fprintf (stderr, "set_rss_data(): fail\n");
#endif
		free_rss_data();
		return NULL;
	}

	if (rss_parse_data(RSS_data) == -1)	// parse data
	{
#ifdef DEBUG
		fprintf (stderr, "rss_parse_data(): fail\n");
#endif
		free_rss_data();
		return NULL;
	}

	free_rss_data();

	return list_head.first;		// return data as list
}

// Set parser options
void rss_set_opt(int opt_type, int options)
{
#ifdef DEBUG
//	printf ("opt_type: %d\n", opt_type);
//	printf ("option: %d\n", options);
#endif

	// Set options for linked-list
	if (opt_type == LLOPTTYPE)
	{
		parser_options.linked_list = options;
	}
	if (opt_type == LLDATAOPTTYPE)
	{
		parser_options.linked_list_data = options;
	}
}
