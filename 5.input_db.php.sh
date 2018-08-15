#!/usr/bin/php

<?php

# Instantiate DB
require 'sources/Database.php';
require 'sources/common_functions.php';
require 'sources/functions/recordsourceidentifier.php';
require 'sources/functions/productidentifier.php';
require 'sources/functions/barcode.php';
require 'sources/functions/descriptivedetail.php';
require 'sources/functions/productformfeature.php';
require 'sources/functions/measure.php';
require 'sources/functions/epubusageconstraint.php';
require 'sources/functions/epublicense.php';
require 'sources/functions/productclassification.php';
require 'sources/functions/productpart.php';

require 'sources/functions/collection.php';
require 'sources/functions/collectionidentifier.php';
require 'sources/functions/collectionsequence.php';

require 'sources/functions/titleelement.php';

require 'sources/functions/nameidentifier.php';
require 'sources/functions/contributordate.php';

require 'sources/functions/supplier.php';
require 'sources/functions/supplieridentifier.php';
require 'sources/functions/website.php';
require 'sources/functions/discountcoded.php';

$conn = new Database();

# Instantiate error.log file
$error_log = new SplFileObject(ERROR_LOG, "a");
$status_log = new SplFileObject(STATUS_LOG, "a");

# Read files in folder
$spit_product_folder = 'xml';
$products_folder = PRODUCTS_SPLIT . DIRECTORY_SEPARATOR . $spit_product_folder . DIRECTORY_SEPARATOR;
$products_xml = glob($products_folder.'*.xml');
foreach($products_xml as $xml_file) {
    $import_flag = TRUE;

    if (!file_exists($xml_file)) {
        $error_log->fwrite(date("Y-m-d H:i:s").' Error: Failed to open file '. $xml_file . PHP_EOL);
        continue;
    }

    # Check product
    $uuid = basename($xml_file, '.xml');
    $sql = "SELECT * FROM products WHERE a001 = '" . $uuid . "';";
    $find_product = $conn->select($sql);
    if (!empty($find_product) && $find_product->num_rows > 0) {
        $import_flag = FALSE;
        // $error_log->fwrite(date("Y-m-d H:i:s") . ' Notice: Product exists with UUID = '. $uuid . PHP_EOL);
        // continue;
    }

    $status_log->fwrite(date("Y-m-d H:i:s") . ' START to import UUID = '. $uuid . PHP_EOL);

    # Parse data
    $xml = simplexml_load_file($xml_file);
    /*
    a001    RecordReference
    a002    NotificationType
    a199    DeletionText
    a194    RecordSourceType
    a197    RecordSourceName
     */
    
    $product = [
        'a001' => (string) $xml->a001,
        'a002' => (string) $xml->a002,
        'a199' => (string) $xml->a199, 
        'a194' => (string) $xml->a194,
        'a197' => (string) $xml->a197,
        'created_at' => date("Y-m-d H:i:s"),
        'updated_at' => date("Y-m-d H:i:s")
    ];

    # Save to products table
    if ($import_flag == TRUE) {
        $conn->insert('products', $product);
    }

    // -----------------------------PREPARE DATA--------------------------------
    # Save all productidentifier tags (v3.0)
    $productidentifier = $xml->xpath('//productidentifier');
    save_productidentifier($productidentifier);

    # Save all productformfeature tags (v3.0)
    $productformfeature = $xml->xpath('//productformfeature');
    save_productformfeature($productformfeature);

    # Save discountcoded tags (v3.0)
    $discountcoded = $xml->xpath('/product/supplydetail/price/discountcoded');
    save_discountcoded($discountcoded);

    # Save all epublicenseexpression tags (v3.0)
    $epublicenseexpression = $xml->xpath('//epublicenseexpression');
    save_epublicenseexpression($epublicenseexpression);
    # Save all epublicense tags (v3.0)
    $epublicense = $xml->xpath('//epublicense');
    save_epublicense($epublicense);

    # Save all collectionidentifier tags (v3.0)
    $collectionidentifier = $xml->xpath('//collectionidentifier');
    save_collectionidentifier($collectionidentifier);
    # Save all collectionsequence tags (v3.0)
    $collectionsequence = $xml->xpath('//collectionsequence');
    save_collectionsequence($collectionsequence);

    # Save all titleelement tags (v3.0)
    $titleelement = $xml->xpath('//titleelement');
    save_titleelement($titleelement);

    # Save all nameidentifier tags (v3.0)
    $nameidentifier = $xml->xpath('//nameidentifier');
    save_nameidentifier($nameidentifier);

    # Save all alternativename tags (v3.0)
    $alternativename = $xml->xpath('//alternativename');
    # save_alternativename($alternativename);

    # Save all contributordate tags (v3.0)
    $contributordate = $xml->xpath('//contributordate');
    save_contributordate($contributordate);

    # Save all supplieridentifier tags (v3.0)
    $supplieridentifier = $xml->xpath('//supplieridentifier');
    save_supplieridentifier($supplieridentifier);

    # Save all website tags (v3.0)
    $website = $xml->xpath('//website');
    save_website($website);

    # Save supplier tags (v3.0)
    $supplier = $xml->xpath('/product/supplydetail/supplier');
    save_supplier($supplier, $product['a001']);
    // -----------------------MAIN TABLES----------------------------------
    # Save recordsourceidentifier tags (v3.0)
    $recordsourceidentifier = $xml->xpath('/product/recordsourceidentifier');
    save_recordsourceidentifier($recordsourceidentifier, $product['a001']);

    # Save barcode tags (v3.0)
    $barcode = $xml->xpath('/product/barcode');
    save_barcode($barcode, $product['a001']);

    # Save descriptivedetail tags (v3.0)
    $descriptivedetail = $xml->xpath('/product/descriptivedetail');
    // save_descriptivedetail($descriptivedetail, $product['a001']);

    # Save measure tags (v3.0)
    $measure = $xml->xpath('/product/descriptivedetail/measure');
    save_measure($measure, $product['a001']);

    # Save epubusageconstraint tags (v3.0)
    $epubusageconstraint = $xml->xpath('/product/descriptivedetail/epubusageconstraint');
    save_epubusageconstraint($epubusageconstraint, $product['a001']);

    # Save productclassification tags (v3.0)
    $productclassification = $xml->xpath('/product/descriptivedetail/productclassification');
    save_productclassification($productclassification, $product['a001']);

    # Save productpart tags (v3.0)
    $productpart = $xml->xpath('/product/descriptivedetail/productpart');
    save_productpart($productpart, $product['a001']);
}
