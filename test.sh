#!/usr/bin/php

<?php
$onix_feed_file = "wiley.1.20180716.xml";
$onix_feed_path = 'onix_feeds' . DIRECTORY_SEPARATOR . $onix_feed_file;

$error_log = new SplFileObject('logs/errors.log', "a");

$lines = new SplFileObject($onix_feed_path);

while (!$lines->eof()) {
    $line = $lines->fgets();
    if (strpos($line, '<supplydetail>') !== false) {
        $error_log->fwrite('xxxxx' . $line . PHP_EOL);
    }
}
