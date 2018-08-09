#!/usr/bin/php

<?php
# Create log file
$errors_log = 'errors.log';
if (!file_exists($errors_log)) {
    $fh = fopen($errors_log, 'a+');
    fclose($fh);
    chmod($errors_log, 0777);
}

# Create products log file
$products_log = 'products.log';
if (!file_exists($products_log)) {
    $fh = fopen($products_log, 'a+');
    fclose($fh);
    chmod($products_log, 0777);
}

# Create folder
$folder_name = "products";
if (!file_exists($folder_name)) {
    mkdir($folder_name, 0777, true);
}