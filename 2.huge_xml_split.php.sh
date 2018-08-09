#!/usr/bin/php

<?php
# Define XML file
// echo "Please input the XML file name: ";
// $handle = fopen ("php://stdin","r");
// $file_name = fgets($handle);

// $file_name = trim($file_name);
// $file_name = "wiley_3.0_1.20180618.xml.xml";
$file_name = "formarted.xml";
$folder_name = "products";
$products_log = 'products.log';
$products_log_file = new SplFileObject($products_log, "a");

# Validate file
if(!file_exists($file_name)){
    $error = 'File ' . $file_name . ' doesnt exist ' . PHP_EOL;
    echo $error;
    fwrite($log_file, date("Y-m-d H:i:s"). $error);
    return;
}

# Get lastest product
$lastest_product = '9780471988038';

# Parse file
$lines = new SplFileObject($file_name);
$flag = 0;
$product_file = '';
$product_xml = '';

while (!$lines->eof()) {
    $line = $lines->fgets();

    // Open tag
    if (strpos($line, '<product>') !== false) {
        $flag = 1;
        // $product_xml .= $line;
    }

    if ( ($flag == 1) && ($line != NULL) ) {
        # Find UID
        if (strpos($line, '<a001>') !== false) {
            $pattern = '/<a001>(.*?)<\/a001>/';
            if (preg_match($pattern, $line, $matches)) {
                $sku = $matches[1];
                $single_product_name = $folder_name . DIRECTORY_SEPARATOR . $sku.'.xml';

                // Log position
                $products_log_file->fwrite($sku . PHP_EOL);
            }
        }
        $product_xml .= $line;
    }

    // Close tag and write file
    if (strpos($line, '</product>') !== false) {
        $flag = 0;
        $product_xml .= '</product>' . PHP_EOL;

        if (!empty($single_product_name)) {
            $single_product = new SplFileObject($single_product_name, "a");
            $single_product->fwrite($product_xml . PHP_EOL);
        }

        // Reset
        $product_xml = '';
    }
}
