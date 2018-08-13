#!/usr/bin/php

<?php
# Create log file
$errors_log = 'errors.log';
if (!file_exists($errors_log)) {
    $fh = fopen($errors_log, 'a+');
    fclose($fh);
    chmod($errors_log, 0777);
}

# Create log file
$log_file = 'log.log';
if (!file_exists($log_file)) {
    $fh = fopen($log_file, 'a+');
    fclose($fh);
    chmod($log_file, 0777);
}

# Create folder
$product_folder = "products";
if (!file_exists($product_folder)) {
    mkdir($product_folder, 0777, true);
}
