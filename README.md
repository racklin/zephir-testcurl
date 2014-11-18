Zephir sampile code
-----------------------------
Using Zephir 0.59 version that supports libraries to call libcurl by cblock.

Build
-----------------------------

1. Fork this project and clone.
2. `cd ext && phpize`
3. `./configure --enable-testcurl && sudo make install`
4. `php ../test.php' will see libcurl version from zephir php ext.


