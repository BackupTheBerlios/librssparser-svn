/*
 * =====================================================================================
 * 
 *       Filename:  rss_options.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  16.02.2009 19:18:40 CET
 *       Revision:  none
 *       Compiler:  gcc
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *        Company:  
 * 
 * =====================================================================================
 */

#ifndef  RSS_OPTIONS_INC
#define  RSS_OPTIONS_INC

//Linked-list options
#define LLOPTTYPE	0

#define LLHAVETITLE 		(1<<0)
#define LLHAVELINK			(1<<1)
#define LLHAVEDESCRIPTION	(1<<2)
#define LLHAVEPUBDATE		(1<<3)

// TODO
#define LLHAVECHANNELINFO	(1<<4)

struct opt
{
	int linked_list; 
};

#endif   /* ----- #ifndef RSS_OPTIONS_INC  ----- */

