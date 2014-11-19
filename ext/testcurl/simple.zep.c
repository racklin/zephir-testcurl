
#ifdef HAVE_CONFIG_H
#include "../ext_config.h"
#endif

#include <php.h>
#include "../php_ext.h"
#include "../ext.h"

#include <Zend/zend_operators.h>
#include <Zend/zend_exceptions.h>
#include <Zend/zend_interfaces.h>

#include "kernel/main.h"
#include "kernel/memory.h"
#include "ext/spl/spl_exceptions.h"
#include "kernel/exception.h"
#include "kernel/operators.h"


#include <stdio.h>
#include <curl/curl.h>




ZEPHIR_INIT_CLASS(Testcurl_Simple) {

	ZEPHIR_REGISTER_CLASS(Testcurl, Simple, testcurl, simple, testcurl_simple_method_entry, 0);

	return SUCCESS;

}

PHP_METHOD(Testcurl_Simple, version) {

	zval *ver;

	ZEPHIR_MM_GROW();
	ZEPHIR_INIT_VAR(ver);
	ZVAL_STRING(ver, "", 1);

	
            ZVAL_STRING(ver, curl_version(), 1);
        
	RETURN_CTOR(ver);

}

PHP_METHOD(Testcurl_Simple, getUrlContent) {

	zval *url_param = NULL;
	zval *url = NULL;

	ZEPHIR_MM_GROW();
	zephir_fetch_params(1, 1, 0, &url_param);

	if (unlikely(Z_TYPE_P(url_param) != IS_STRING && Z_TYPE_P(url_param) != IS_NULL)) {
		zephir_throw_exception_string(spl_ce_InvalidArgumentException, SL("Parameter 'url' must be a string") TSRMLS_CC);
		RETURN_MM_NULL();
	}

	if (likely(Z_TYPE_P(url_param) == IS_STRING)) {
		zephir_get_strval(url, url_param);
	} else {
		ZEPHIR_INIT_VAR(url);
		ZVAL_EMPTY_STRING(url);
	}


	
            CURL *curl;
            CURLcode res;
   
            curl = curl_easy_init();
            if(curl) {
              curl_easy_setopt(curl, CURLOPT_URL, Z_STRVAL_P(url));
              curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
   
              res = curl_easy_perform(curl);
   
              curl_easy_cleanup(curl);
            }
        
	ZEPHIR_MM_RESTORE();

}

