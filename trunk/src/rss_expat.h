/*
 * =====================================================================================
 * 
 *       Filename:  rss_expat.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  24.12.2008 11:24:51 CET
 *       Revision:  none
 *       Compiler:  gcc
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *        Company:  
 * 
 * =====================================================================================
 */

#ifndef  RSS_EXPAT_INC
#define  RSS_EXPAT_INC

#include "rss.h"
#include "rss_data.h"

#include <expat.h>

// Local struct to hold parsed data
struct item_data
{
	size_t title_size;
	char *title;
	size_t link_size;
	char *link;
	size_t description_size;
	char *description;
	size_t pubdate_size;
	char *pubdate;
};

int 	rss_parse_data(RSS_data_t *RSS_data);

void	xml_start_handler(void *user_data, const XML_Char *name, const XML_Char **atts);
void	xml_stop_handler(void *user_data, const XML_Char *name);


#endif   /* ----- #ifndef RSS_EXPAT_INC  ----- */

