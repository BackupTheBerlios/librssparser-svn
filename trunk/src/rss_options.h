/*
 * =====================================================================================
 * 
 *       Filename:  rss_options.h
 * 
 *    Description:  Simple rss parser upon expat
 * 
 *        Version:  1.0
 *        Created:  16.02.2009 19:18:40 CET
 * 
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 * 
 * =====================================================================================
 */

#ifndef  RSS_OPTIONS_INC
#define  RSS_OPTIONS_INC

//Linked-list options
#define LLOPTTYPE			0

#define LLHAVETITLE			1
#define LLHAVELINK			2
#define LLHAVEDESCRIPTION	3
#define LLHAVEPUBDATE		4

// TODO
#define LLHAVECHANNELINFO	5

// Data on linked-list options
#define LLDATAOPTTYPE		1

#define LLDATACLEARCCH		1
#define LLDATACLEARHTML		2

// Options fields structure
struct opt
{
	int linked_list; 
	int linked_list_data;
};

#endif   /* ----- #ifndef RSS_OPTIONS_INC  ----- */
