/*
 * =====================================================================================
 * 
 *       Filename:  rss.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  23.12.2008 11:51:53 CET
 *       Revision:  none
 *       Compiler:  gcc
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm),
 *        Company:  
 * 
 * =====================================================================================
 */

#ifndef  KERNEL_RSS_INC
#define  KERNEL_RSS_INC

#include <stdio.h>

//Linked-list options
#define LLOPTTYPE	0

#define LLHAVETITLE 		(1<<0)
#define LLHAVELINK			(1<<1)
#define LLHAVEDESCRIPTION	(1<<2)
#define LLHAVEPUBDATE		(1<<3)
#define LLHAVECHANNELINFO	(1<<4)

// Linked list item
struct RSS_item_t
{
	int item_number;
	char *title;
	char *link;
	char *description;
	struct RSS_item_t *next_item;
};

struct RSS_item_t	*rss_fetch(char *input_data, size_t input_data_size);
void				free_rss_list(struct RSS_item_t *RSS_item_list);
void				rss_set_opt(int opt_type, int option);

#endif   /* ----- #ifndef KERNEL_RSS_INC  ----- */

