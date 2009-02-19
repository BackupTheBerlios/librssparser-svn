/*
 * =====================================================================================
 *
 *       Filename:  rss_clean.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  19.02.2009 19:11:57 CET
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *
 * =====================================================================================
 */

#include <ctype.h>

#include "rss_clean.h"
#include "rss_options.h"

extern struct opt parser_options;

// Clean data on linked-list as user wants
void clean_linked_list_data(struct item_data *item_data_ptr)
{
	char *tmp = NULL;

	// Clear control characters
	if (parser_options.linked_list_data & LLDATACLEARCCH)
	{
		if ((tmp = item_data_ptr->title) != NULL)
		{
			while(*tmp != 0) // Don't delete '\0' !
			{
				if (iscntrl(*tmp))
					*tmp = ' ';
				tmp++;
			}
		}

		if ((tmp = item_data_ptr->link) != NULL)
		{
			while(*tmp != 0)
			{
				if (iscntrl(*tmp))
					*tmp = ' ';
				tmp++;
			}
		}

		if ((tmp = item_data_ptr->description) != NULL)
		{
			while(*tmp != 0)
			{
				if (iscntrl(*tmp))
					*tmp = ' ';
				tmp++;
			}
		}

		if ((tmp = item_data_ptr->pubdate) != NULL)
		{
			while(*tmp != 0)
			{
				if (iscntrl(*tmp))
					*tmp = ' ';
				tmp++;
			}
		}
	}
	
	// Clear html tags TODO
	if (parser_options.linked_list_data & LLDATACLEARHTML)
	{
	
	}
}
