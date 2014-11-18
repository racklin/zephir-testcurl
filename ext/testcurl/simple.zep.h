
extern zend_class_entry *testcurl_simple_ce;

ZEPHIR_INIT_CLASS(Testcurl_Simple);

PHP_METHOD(Testcurl_Simple, version);

ZEPHIR_INIT_FUNCS(testcurl_simple_method_entry) {
	PHP_ME(Testcurl_Simple, version, NULL, ZEND_ACC_PUBLIC)
  PHP_FE_END
};
