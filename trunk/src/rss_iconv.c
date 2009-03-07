/*
 * =====================================================================================
 *
 *       Filename:  rss_iconv.c
 *
 *    Description:  Simple rss parser upon expat
 *
 *        Version:  1.0
 *        Created:  28.12.2008 14:51:50 CET
 *
 *         Author:  Slawomir Stepien (dienet@poczta.fm), 
 *
 * =====================================================================================
 */

#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <iconv.h>
#include <sys/types.h>
#include <regex.h>
#include <string.h>
#include <errno.h>

#include "rss_data.h"

// Get current encoding of raw data
char *get_data_code(RSS_data_t *RSS_data)
{
	int x = 0;
	char *from = NULL, *tmp = NULL;
	size_t nmatch = -1;
	regmatch_t pmatch[2];
	regex_t *preg = NULL;

	if ((preg = malloc(sizeof(regex_t))) == NULL)
		return NULL;

	memset(preg, 0, sizeof(preg));

	for (x = 0; x < 2; x++)
	{
		pmatch[x].rm_so = -1;
		pmatch[x].rm_eo = -1;
	}

	// Thank you mina98 for regexp !
	regcomp(preg, "<?xml[[:space:]].*[[:space:]]encoding[[:space:]]*=[[:space:]]*[\"']([^\"'>]*)[\"'].*?>", \
			REG_EXTENDED);

   	regexec(preg, RSS_data->data, nmatch, pmatch, REG_NOTBOL);

	// The secend one is corrent. tmp marks start of encoding string
	tmp = RSS_data->data + pmatch[1].rm_so;

	// Save document encoding as string
	if ((from = strndup(tmp, pmatch[1].rm_eo - pmatch[1].rm_so)) == NULL)
		return NULL;

	regfree(preg);
	free(preg);

	return from;
}

// Convert raw data to UTF8 before parsing
int data_to_utf8(RSS_data_t *RSS_data)
{
	char *from = NULL;
	char *out = NULL;
	size_t data_size;
	size_t out_size;
	size_t tmp_out_size;
	char *tmp_data = NULL;
	char *tmp_out = out;
	int iconv_ret = 0;

	iconv_t fd;

	if ((from = get_data_code(RSS_data)) == NULL)
	{
#ifdef DEBUG
		fprintf(stderr, "get_data_code(): fail\n");
#endif
		return -1;
	}

	// Need to convert - it's not UTF-8 encoding
	if ((strcmp(from, "UTF-8") != 0) && (strcmp(from, "utf-8") != 0))
	{
		if ((fd = iconv_open("UTF-8", from)) == (iconv_t)-1)
		{
#ifdef DEBUG
			fprintf(stderr, "iconv_open(): fail\n");
#endif
			return -2;
		}

		// Output size = input size + 256
		tmp_out_size = out_size = RSS_data->data_size+256;

		if ((tmp_out = out = malloc(out_size)) == NULL)
		{
#ifdef DEBUG
			fprintf(stderr, "malloc(): fail\n");
#endif
			return -3;
		}

		memset(out, 0, out_size);

		// Save pointers
		tmp_data = RSS_data->data;
		data_size = RSS_data->data_size;

		// Convert 
		iconv_ret = iconv(fd, &(RSS_data->data), &data_size, &out, &out_size);

		while((iconv_ret == -1) && (errno == E2BIG))
		{
			RSS_data->data = tmp_data;
			data_size = RSS_data->data_size+1;

			out_size = (tmp_out_size += 512);

			out = realloc(tmp_out, out_size);
		
			tmp_out = out;
			tmp_out_size = out_size;

			iconv_ret = iconv(fd, &(RSS_data->data), &data_size, &out, &out_size);
		}

		*out = '\0';

		// Free old data
		free(tmp_data);

		// Save new data length
		RSS_data->data_size = strlen(tmp_out);
	
		if ((RSS_data->data = malloc(RSS_data->data_size)) == NULL)
		{
#ifdef DEBUG
			fprintf(stderr, "malloc(): fail\n");
#endif
			return -5;
		}

		*(RSS_data->data) = '\0';
		
		// Save new data
		strncpy(RSS_data->data, tmp_out, RSS_data->data_size);

		free(tmp_out);
		free(from);
		iconv_close(fd);
	}
	else
		free(from);

	return 0;
}
