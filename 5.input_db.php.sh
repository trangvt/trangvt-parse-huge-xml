#!/usr/bin/php

<?php

# Instantiate DB
require 'sources/Database.php';
require 'sources/functions/recordsourceidentifier.php';
require 'sources/functions/productidentifier.php';
require 'sources/functions/barcode.php';
require 'sources/functions/descriptivedetail.php';
require 'sources/functions/productformfeature.php';
require 'sources/functions/measure.php';
require 'sources/functions/epubusageconstraint.php';
require 'sources/functions/epublicense.php';
require 'sources/functions/productpart.php';
require 'sources/functions/collection.php';
require 'sources/functions/supplieridentifier.php';
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
    $sql = "SELECT * FROM products WHERE a001 = '" . $uuid . "'";
    $find_product = $conn->select($sql);
    if (!empty($find_product) && $find_product->num_rows > 0) {
        $import_flag = FALSE;
        $error_log->fwrite(date("Y-m-d H:i:s") . ' Notice: Product exists with UUID = '. $uuid . PHP_EOL);
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

    x314    v3.0: descriptivedetail - ProductComposition
    b012    v3.0: descriptivedetail - ProductForm
            v2.1: ProductForm
    b057    v3.0: descriptivedetail - CollectionType
    b058    v3.0: descriptivedetail - EditionStatement (JSON - XHTML is enabled)
    b083    v3.0: publishingdetail - CountryOfPublication
    b394    v3.0: publishingdetail - PublishingStatus
    x512    v3.0: publishingdetail->copyrightstatement - CopyrightType
    b089    v3.0: publishingdetail->salesrights - SalesRightsType
     */
    
    $product = [
        'a001' => (string) $xml->a001,
        'a002' => (string) $xml->a002,
        'a199' => (string) $xml->a199, 
        'a194' => (string) $xml->a194,
        'a197' => (string) $xml->a197,
        // 'x314' => (string) $xml->descriptivedetail->x314,
        // 'b012' => (string) $xml->descriptivedetail->x314,
        // 'b057' => (string) $xml->descriptivedetail->b057,
        // 'b058' => (string) $xml->descriptivedetail->b058,
        // 'b083' => (string) $xml->publishingdetail->salesrights->b089,
        // 'b394' => (string) $xml->publishingdetail->b394,
        // 'x512' => (string) $xml->publishingdetail->copyrightstatement->x512,
        'created_at' => date("Y-m-d H:i:s"),
        'updated_at' => date("Y-m-d H:i:s")
    ];

    # Save to products table
    if ($import_flag == TRUE) {
        $conn->insert('products', $product);
    }

    // PREPARE DATA
    # Save discountcoded tags (v3.0)
    $discountcoded_xml = $xml->xpath('/product/supplydetail/price/discountcoded');
    save_discountcodeds($discountcoded_xml); 

    // MAIN TABLES
    # Save recordsourceidentifier tags (v3.0)
    $recordsourceidentifier_xml = $xml->xpath('/product/recordsourceidentifier');
    # save_recordsourceidentifiers($recordsourceidentifier_xml, $product['a001']);

    # Save productidentifier tags (v3.0)
    $productidentifier_xml = $xml->xpath('/product/productidentifier');
    # save_productidentifiers($productidentifier_xml, $product['a001']);

    # Save barcode tags (v3.0)
    $barcode_xml = $xml->xpath('/product/barcode');
    # save_barcodes($barcode_xml, $product['a001']);

    # Save descriptivedetail tags (v3.0)
    $descriptivedetail_xml = $xml->xpath('/product/descriptivedetail');
    # save_descriptivedetails($descriptivedetail_xml, $product['a001']);

    # Save productformfeature tags (v3.0)
    $productformfeature_xml = $xml->xpath('/product/descriptivedetail/productformfeature');
    # save_productformfeatures($productformfeature_xml, $product['a001']);

    # Save measure tags (v3.0)
    $measure_xml = $xml->xpath('/product/descriptivedetail/measure');
    # save_measures($measure_xml, $product['a001']);

    # Save epubusageconstraint tags (v3.0)
    $epubusageconstraint_xml = $xml->xpath('/product/descriptivedetail/epubusageconstraint');
    # save_epubusageconstraints($epubusageconstraint_xml, $product['a001']);

    # Save epublicense tags (v3.0)
    $epublicense_xml = $xml->xpath('/product/descriptivedetail/epublicense');
    # save_epublicenses($epublicense_xml, $product['a001']);

    # Save productclassification tags (v3.0)
    $productclassification_xml = $xml->xpath('/product/descriptivedetail/productclassification');
    # save_productclassifications($productclassification_xml, $product['a001']);

    # Save productpart tags (v3.0)
    $productpart_xml = $xml->xpath('/product/descriptivedetail/productpart');
    # save_productparts($productpart_xml, $product['a001']);

    # Save supplieridentifier tags (v3.0)
    $supplieridentifier_xml = $xml->xpath('/product/supplydetail/supplier/supplieridentifier');
    # save_productparts($supplieridentifier_xml, $product['a001']);

 
}
