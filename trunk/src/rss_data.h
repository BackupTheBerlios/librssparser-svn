/*
 * =====================================================================================
 * 
 *       Filename:  rss_data.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  24.12.2008 11:17:39 CET
 *       Revision:  none
 *       Compiler:  gcc
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *        Company:  
 * 
 * =====================================================================================
 */

#ifndef  RSS_DATA_INC
#define  RSS_DATA_INC

typedef struct
{
	size_t data_size;
	char *data;
} RSS_data_t;

#endif   /* ----- #ifndef RSS_DATA_INC  ----- */

