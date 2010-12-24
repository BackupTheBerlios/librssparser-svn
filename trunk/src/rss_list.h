/*
 * =====================================================================================
 * 
 *       Filename:  rss_list.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  24.12.2008 12:26:13 CET
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 * 
 * =====================================================================================
 */

#ifndef  RSS_LIST_INC
#define  RSS_LIST_INC

#include "rss.h"
#include "rss_expat.h"

// Save items
struct list_head_t
{
	struct RSS_item_t *first;
	struct RSS_item_t *last;
} list_head;

// Add data to linked-list
int add_rss_data(struct item_data const *item_data_ptr);

#endif   /* ----- #ifndef RSS_LIST_INC  ----- */
