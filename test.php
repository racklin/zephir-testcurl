<?php

dl("testcurl.so");

use Testcurl\Simple;

echo "libcurl version = " . Simple::version() . PHP_EOL ;

// display readme 

$url = 'https://raw.githubusercontent.com/racklin/zephir-testcurl/master/README.md';

Simple::getUrlContent($url);
