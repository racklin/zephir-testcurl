Zephir sampile code
-----------------------------
Zephir 0.59 version supports 'pkg-config' to check and include system libraries by using 'package-dependencies' option. 

This project demo using 'libcurl >= 7.20' with Zephir's cblock.

Build
-----------------------------

1. Fork this project and clone.
2. `cd ext && phpize`
3. `./configure --enable-testcurl && make && sudo make install`
4. `php ../test.php' will see libcurl version from zephir php ext.


