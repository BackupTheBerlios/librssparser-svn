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

#include "rss.h"
#include "rss_expat.h"
#include "rss_list.h"
#include "rss_data.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <expat.h>

RSS_data_t *RSS_data = NULL;

static int set_rss_data(char *input_data, size_t input_data_size);
static void free_rss_data(void);

// Save raw data to our struct
int set_rss_data(char *input_data, size_t input_data_size)
{
	RSS_data = malloc(sizeof(RSS_data_t));

	if (RSS_data != NULL)
	{
		RSS_data->data_size = 0;
		RSS_data->data = NULL;

		RSS_data->data = strdup(input_data);
		RSS_data->data_size = input_data_size;

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
struct RSS_item_t *rss_fetch(char *input_data, size_t input_data_size)
{
	struct RSS_item_t *RSS_item_list = NULL;
	list_head.first = list_head.last = RSS_item_list;	// start list

	if (set_rss_data(input_data, input_data_size) == -1)
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
