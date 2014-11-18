PHP_ARG_ENABLE(testcurl, whether to enable testcurl, [ --enable-testcurl   Enable Testcurl])

if test "$PHP_TESTCURL" = "yes"; then

	
	AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
	if test "x$PKG_CONFIG" = "xno"; then
		AC_MSG_RESULT([pkg-config not found])
		AC_MSG_ERROR([Please reinstall the pkg-config distribution])
	fi


	AC_MSG_CHECKING([for libcurl])
	if $PKG_CONFIG --exists libcurl; then
		PHP_LIBCURL_VERSION=`$PKG_CONFIG libcurl --modversion`
		PHP_LIBCURL_PREFIX=`$PKG_CONFIG libcurl --variable=prefix`

		if $PKG_CONFIG --atleast-version=6.30 libcurl; then
			AC_MSG_RESULT([found version $PHP_LIBCURL_VERSION, under $PHP_LIBCURL_PREFIX])
			PHP_LIBCURL_LIBS=`$PKG_CONFIG libcurl --libs`
			PHP_LIBCURL_INCS=`$PKG_CONFIG libcurl --cflags`

			PHP_EVAL_LIBLINE($PHP_LIBCURL_LIBS, TESTCURL_SHARED_LIBADD)
			PHP_EVAL_INCLINE($PHP_LIBCURL_INCS)
		else
			AC_MSG_ERROR(Requested 'libcurl >= 6.30' but version of libcurl is $PHP_LIBCURL_VERSION)
		fi
	else
		AC_MSG_ERROR(Unable to find libcurl installation)
	fi



	if ! test "x" = "x"; then
		PHP_EVAL_LIBLINE(, TESTCURL_SHARED_LIBADD)
	fi

	AC_DEFINE(HAVE_TESTCURL, 1, [Whether you have Testcurl])
	testcurl_sources="testcurl.c kernel/main.c kernel/memory.c kernel/exception.c kernel/hash.c kernel/debug.c kernel/backtrace.c kernel/object.c kernel/array.c kernel/extended/array.c kernel/string.c kernel/fcall.c kernel/require.c kernel/file.c kernel/operators.c kernel/concat.c kernel/variables.c kernel/filter.c kernel/iterator.c kernel/exit.c testcurl/simple.zep.c "
	PHP_NEW_EXTENSION(testcurl, $testcurl_sources, $ext_shared,,  $PHP_LIBCURL_INCS )
	PHP_SUBST(TESTCURL_SHARED_LIBADD)

	old_CPPFLAGS=$CPPFLAGS
	CPPFLAGS="$CPPFLAGS $INCLUDES"

	AC_CHECK_DECL(
		[HAVE_BUNDLED_PCRE],
		[
			AC_CHECK_HEADERS(
				[ext/pcre/php_pcre.h],
				[
					PHP_ADD_EXTENSION_DEP([testcurl], [pcre])
					AC_DEFINE([ZEPHIR_USE_PHP_PCRE], [1], [Whether PHP pcre extension is present at compile time])
				],
				,
				[[#include "main/php.h"]]
			)
		],
		,
		[[#include "php_config.h"]]
	)

	AC_CHECK_DECL(
		[HAVE_JSON],
		[
			AC_CHECK_HEADERS(
				[ext/json/php_json.h],
				[
					PHP_ADD_EXTENSION_DEP([testcurl], [json])
					AC_DEFINE([ZEPHIR_USE_PHP_JSON], [1], [Whether PHP json extension is present at compile time])
				],
				,
				[[#include "main/php.h"]]
			)
		],
		,
		[[#include "php_config.h"]]
	)

	CPPFLAGS=$old_CPPFLAGS

	PHP_INSTALL_HEADERS([ext/testcurl], [php_TESTCURL.h])

fi
