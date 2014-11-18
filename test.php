<?php

dl("testcurl.so");

$c = new \Testcurl\Simple();

echo $c->version();
