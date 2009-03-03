/*
 * =====================================================================================
 * 
 *       Filename:  rss_clean.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  19.02.2009 19:10:38 CET
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 * 
 * =====================================================================================
 */

#ifndef  RSS_CLEAN_INC
#define  RSS_CLEAN_INC

#include "rss_expat.h"

// This function cleans data before it's insert on linked-list
int clean_linked_list_data(struct item_data *item_data_ptr);

#endif   /* ----- #ifndef RSS_CLEAN_INC  ----- */

