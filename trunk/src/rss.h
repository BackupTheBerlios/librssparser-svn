/*
 * =====================================================================================
 * 
 *       Filename:  rss.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  23.12.2008 11:51:53 CET
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm),
 * 
 * =====================================================================================
 */

#ifndef  RSS_INC
#define  RSS_INC

#include <stdio.h>

// Linked list item
struct RSS_item_t
{
	int item_number;
	char *title;
	char *link;
	char *description;
	char *pubdate;
	struct RSS_item_t *next_item;
};

// Fetch data for user form input_data and return it as linked-list
struct RSS_item_t *rss_fetch(char *input_data);

// Free list returned from rss_fetch()
int free_rss_list(struct RSS_item_t *RSS_item_list);

// Set parser options
void rss_set_opt(int opt_type, int option);

#endif   /* ----- #ifndef RSS_INC  ----- */

