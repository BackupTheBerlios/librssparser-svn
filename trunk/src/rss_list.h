/*
 * =====================================================================================
 * 
 *       Filename:  rss_list.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  24.12.2008 12:26:13 CET
 *       Revision:  none
 *       Compiler:  gcc
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *        Company:  
 * 
 * =====================================================================================
 */

#ifndef  RSS_LIST_INC
#define  RSS_LIST_INC

#include "rss.h"

// Save items
struct list_head_t
{
	struct RSS_item_t *first;
	struct RSS_item_t *last;
} list_head;

void add_rss_data(const char *title, const char *link, const char *description);

#endif   /* ----- #ifndef RSS_LIST_INC  ----- */

