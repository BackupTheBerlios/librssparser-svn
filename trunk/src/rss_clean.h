/*
 * =====================================================================================
 * 
 *       Filename:  rss_clean.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  19.02.2009 19:10:38 CET
 *       Revision:  none
 *       Compiler:  gcc
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *        Company:  
 * 
 * =====================================================================================
 */

#ifndef  RSS_CLEAN_INC
#define  RSS_CLEAN_INC

#include "rss_expat.h"

void clean_linked_list_data(struct item_data *item_data_ptr);

#endif   /* ----- #ifndef RSS_CLEAN_INC  ----- */

