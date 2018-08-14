#!/usr/bin/php

<?php
# Define XML file
# echo "Please input the XML file name: ";
# $handle = fopen ("php://stdin","r");
# $onix_feed = fgets($handle);
# $onix_feed = trim($onix_feed);

# $onix_feed_file = "wiley_3.0_1.20180618.xml.xml";
$onix_feed_file = "wiley.1.20180716.xml";
# $onix_feed_file = "formarted.xml";
$onix_feed_path = 'onix_feeds' . DIRECTORY_SEPARATOR . $onix_feed_file;

$error_log = new SplFileObject('errors.log', "a");
$log_file = new SplFileObject('log.log', "a");

# Validate file
if(!file_exists($onix_feed_path)){
    $error = date("Y-m-d H:i:s") . ' Error: File ' . $onix_feed_file . ' doesnt exist ' . PHP_EOL;
    $error_log->fwrite($error);
    return;
}

# START to split
$log_file->fwrite(date("Y-m-d H:i:s") . ' START to split ' . $onix_feed_file . PHP_EOL);

# Create folder to contains split file
$spit_product_folder = "products" . DIRECTORY_SEPARATOR . $onix_feed_file;
if (!file_exists($spit_product_folder)) {
    mkdir($spit_product_folder, 0777, true);
}
$log_file->fwrite(date("Y-m-d H:i:s") . ' Create split product folder ' . $onix_feed_file . PHP_EOL);

# Create products log file
$products_log = $spit_product_folder . DIRECTORY_SEPARATOR . 'products.log';
if (!file_exists($products_log)) {
    $fh = fopen($products_log, 'a+');
    fclose($fh);
    chmod($products_log, 0777);
}
$products_log_file = new SplFileObject($products_log, "a");
/*
$products_log_file->seek(PHP_INT_MAX);
$line_total = $products_log_file->key() - 1;

if ($line_total >= 0) {
    $products_log_file->seek($line_total);
    $lastest_product = $products_log_file->current();
}
*/

# Parse file
$lines = new SplFileObject($onix_feed_path);
$product_flag = 0;
$product_xml = '';

$header_flag = 0;
$header_xml_path = $spit_product_folder . DIRECTORY_SEPARATOR . 'header.xml';
if (!file_exists($header_xml_path)) {
    $header_xml_file = new SplFileObject($header_xml_path, "a");
}

# Reached end of file
while (!$lines->eof()) {
    $line = $lines->fgets();

    if (!empty($header_xml_file)) {
        # Open header tag
        if (strpos($line, '<header>') !== false) {
            $header_flag = 1;
        }

        if ($header_flag == 1 && $product_flag == 0) {
            $header_xml_file->fwrite($line);
        }

        # Close header tag
        if (strpos($line, '</header>') !== false) {
            $header_flag = 0;
            $log_file->fwrite(date("Y-m-d H:i:s") . ' Create ' . $header_xml_path . PHP_EOL);
        }
    }
    
    # Open product tag
    if (strpos($line, '<product>') !== false) {
        $product_flag = 1;
    }

    if (($product_flag == 1) && ($line != NULL)) {
        # Find UID
        if (strpos($line, '<a001>') !== false) {
            $pattern = '/<a001>(.*?)<\/a001>/';
            if (preg_match($pattern, $line, $matches)) {
                $uuid = $matches[1];
                $single_product_name = $spit_product_folder . DIRECTORY_SEPARATOR . $uuid.'.xml';

                if (!file_exists($single_product_name)) {
                    $products_log_file->fwrite(date("Y-m-d H:i:s") . ' Create xml file for product has uuid = ' . $uuid . PHP_EOL);
                }
            }
        }
        $product_xml .= $line;
    }

    # Close product tag and write file
    if (strpos($line, '</product>') !== false) {
        if (!empty($single_product_name) && !file_exists($single_product_name)) {
            $single_product = new SplFileObject($single_product_name, "a");
            $single_product->fwrite($product_xml);
        }

        # Reset
        $product_flag = 0;
        $product_xml = '';
    }
}

$log_file->fwrite(date("Y-m-d H:i:s") . ' END of split ' . $onix_feed_file . PHP_EOL);
