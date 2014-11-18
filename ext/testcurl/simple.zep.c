
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

