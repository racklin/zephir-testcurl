
extern zend_class_entry *testcurl_simple_ce;

ZEPHIR_INIT_CLASS(Testcurl_Simple);

PHP_METHOD(Testcurl_Simple, version);
PHP_METHOD(Testcurl_Simple, getUrlContent);

ZEND_BEGIN_ARG_INFO_EX(arginfo_testcurl_simple_geturlcontent, 0, 0, 1)
	ZEND_ARG_INFO(0, url)
ZEND_END_ARG_INFO()

ZEPHIR_INIT_FUNCS(testcurl_simple_method_entry) {
	PHP_ME(Testcurl_Simple, version, NULL, ZEND_ACC_PUBLIC|ZEND_ACC_STATIC)
	PHP_ME(Testcurl_Simple, getUrlContent, arginfo_testcurl_simple_geturlcontent, ZEND_ACC_PUBLIC|ZEND_ACC_STATIC)
  PHP_FE_END
};
