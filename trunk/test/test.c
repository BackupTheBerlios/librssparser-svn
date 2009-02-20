/*
 * =====================================================================================
 *
 *       Filename:  test.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  23.12.2008 15:09:06 CET
 *
 *         Author:   (), 
 *
 * =====================================================================================
 */

#include <rss.h>
#include <rss_options.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <curl/curl.h>
#include <curl/easy.h>

char *rss_buf = NULL;
size_t rss_size = 0;

size_t curl_header(void *ptr, size_t size, size_t nmemb, void *stream) 
{
	size_t data_size = size*nmemb;
	size_t data_pos;
	char line[data_size+1];
	char *ptr_data = ptr;

	memset(line, 0, data_size+1);

	for (data_pos = 0; data_pos < data_size; data_pos++)
		line[data_pos] = ptr_data[data_pos];

	sscanf(line, "Content-Length: %d\n", &rss_size);
	
	(void)stream;

	return data_size;
}

size_t curl_get_data(void *ptr, size_t size, size_t nmemb, void *stream)
{
	size_t data_size = size * nmemb;
	size_t data_pos;
	char line[data_size];
	char *ptr_data = ptr;

	if (rss_buf == NULL)
	{
		if ((rss_buf = malloc(rss_size+1)) == NULL)
			return -1;

		memset(rss_buf, 0, rss_size+1);
	}

	memset(line, 0, data_size);	

	for (data_pos = 0; data_pos < data_size; data_pos++)
		line[data_pos] = ptr_data[data_pos];
	
	strncat(rss_buf, line, data_size);

	(void)stream;

	return data_size;
}

int main(int argc, char **argv)
{
	struct RSS_item_t *lista, *tmp;

	char *url = NULL;
	CURL *c_url = NULL;
	CURLcode curl_error = 0;
	long http_code = 0;

	if (argc != 3)
	{
		printf("usage: %s [address] [file]\n", argv[0]);
		return -1;
	}

	curl_error = curl_global_init(CURL_GLOBAL_NOTHING);

	if ((c_url = curl_easy_init()) == NULL)
		return -1;

	url = malloc(strlen(argv[1])+strlen(argv[2])+2);

	url[0] = '\0';
	strcat(url, argv[1]);
	strcat(url, "/");
	strcat(url, argv[2]);

	curl_error = curl_easy_setopt(c_url, CURLOPT_URL, url);
	curl_error = curl_easy_setopt(c_url, CURLOPT_HEADERFUNCTION, curl_header);
	if ((curl_error = curl_easy_setopt(c_url, CURLOPT_WRITEFUNCTION, curl_get_data)) != 0)
		return -1;
	
	if ((curl_error = curl_easy_perform(c_url)) != 0)
		return -1;

	curl_error = curl_easy_getinfo(c_url, CURLINFO_RESPONSE_CODE, &http_code);

	if ((http_code == 404) || (http_code == 301))
	{
		rss_size = 0;
		free(rss_buf);
		rss_buf = NULL;

		curl_easy_cleanup(c_url);
		curl_global_cleanup();

		free(url);

		return -1;
	}

	curl_easy_cleanup(c_url);
	curl_global_cleanup();

	free(url);

	rss_set_opt(LLDATAOPTTYPE, LLDATACLEARCCH | LLDATACLEARHTML);
	lista = rss_fetch(rss_buf);

	if (lista == NULL)
	{
		free_rss_list(lista);
		return -1;
	}

	tmp = lista;

	while(tmp != NULL)
	{
		printf ("%d\n------------\n%s\n%s\n%s\n%s\n", tmp->item_number, tmp->title, tmp->link, \
				tmp->description, tmp->pubdate);

		if (tmp->item_number > 0)
			printf ("\n");

		tmp = tmp->next_item;
	}

	free_rss_list(lista);
	free(rss_buf);

	return 0;
}

