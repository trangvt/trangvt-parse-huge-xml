#!/usr/bin/php

<?php
# Instantiate DB
require 'Database.php';
$conn = new Database();

# Instantiate error.log file
$error_log = new SplFileObject('error.log', "a");
// $error_log->fwrite($product_xml . PHP_EOL);

# Read files in folder
$folder_name = 'products/';
$xml_files = glob($folder_name.'*.xml');
foreach($xml_files as $xml_file) {

    if (!file_exists($xml_file)) {
        $error_log->fwrite(date("Y-m-d H:i:s").' Failed to open file '. $xml_file . PHP_EOL);
        continue;
    }

    // Check product
    $uid = basename($xml_file, '.xml');
    $sql = "SELECT * FROM products WHERE a001 = '" . $uid . "'";
    $find_product = $conn->select($sql);
    if ($find_product->num_rows > 0) {
        $row = $find_product->fetch_assoc();
        $product_id = $row["id"];
        $error_log->fwrite(date("Y-m-d H:i:s") . ' Product exist with UID = '. $uid . PHP_EOL);
        // continue;
    }

    // Parse data
    $xml = simplexml_load_file($xml_file);
    /*
    a001    RecordReference
    a002    NotificationType
    a194    RecordSourceType
    x314    v3.0: descriptivedetail - ProductComposition
    b012    v3.0: descriptivedetail - ProductForm
            v2.1: ProductForm
    b057    v3.0: descriptivedetail - CollectionType
    b058    v3.0: descriptivedetail - EditionStatement (JSON - XHTML is enabled)
    b083    v3.0: publishingdetail - CountryOfPublication
    b394    v3.0: publishingdetail - PublishingStatus
    x512    v3.0: publishingdetail->copyrightstatement - CopyrightType
    b089    v3.0: publishingdetail->salesrights - SalesRightsType
    x450    v3.0: publishingdetail->salesrights->territory - RegionsIncluded
    b061    v2.0: NumberOfPages
     */
    $product = [
        'a001' => (string) $xml->a001,
        'a002' => (string) $xml->a002,
        'a194' => (string) $xml->a194,
        'x314' => (string) $xml->descriptivedetail->x314,
        'b012' => (string) $xml->descriptivedetail->x314,
        'b057' => (string) $xml->descriptivedetail->b057,
        'b058' => (string) $xml->descriptivedetail->b058,
        'b083' => (string) $xml->publishingdetail->salesrights->b089,
        'b394' => (string) $xml->publishingdetail->b394,
        'x512' => (string) $xml->publishingdetail->copyrightstatement->x512,
        'x450' => (string) $xml->publishingdetail->salesrights->territory->x450,
        'b061' => $xml->b061 ? (string) $xml->b061 : 0, 
        'created_at' => date("Y-m-d H:i:s"),
        'updated_at' => date("Y-m-d H:i:s")
    ];

    // Save to products table
    $keys = implode(', ', array_keys($product));
    $values = implode("', '", array_values($product));
    $sql = "INSERT INTO products (" . $keys . ") VALUES ('" . $values . "')";
    if (!isset($product_id)) {
        $product_id = $conn->query($sql);
    }

    //Save to productidentifier table
    $productidentifier_xml = $xml->xpath('/product/productidentifier');
    save_productidentifier($productidentifier_xml, $product_id);

    //Save to barcodes table
    $barcode_xml = $xml->xpath('/product/barcode');
    save_barcodes($barcode_xml, $product_id);
}


function save_productidentifier($productidentifier_xml, $product_id)
{
    $conn = new Database();
    /*
    b221    v3.0: productidentifier - ProductIDType
            v2.1: productidentifier - ProductIDType
    b244    v3.0: productidentifier - IDValue
            v2.1: productidentifier - IDValue
    b246    v2.1: productidentifier - Barcode
     */
    foreach ($productidentifier_xml as $key => $value) {
        $b221 = (string) $value->b221;
        $b244 = (string) $value->b244;
        $b246 = isset($value->b246) ? (string) $value->b246 : NULL;

        $sql = "SELECT * FROM productidentifier
                WHERE b221 = '" . $b221 . "'
                AND b244 = '" . $b244 . "'
                AND b246 = '" . $b246 . "'
                AND product_id = '" . $product_id . "'";
        $find_productidentifier = $conn->select($sql);
        if ($find_productidentifier->num_rows > 0) {
            continue;
        }

        $productidentifier = [
            'b221' => $b221,
            'b244' => $b244,
            'b246' => $b246,
            'product_id' => $product_id,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        $keys = implode(', ', array_keys($productidentifier));
        $values = implode("', '", array_values($productidentifier));

        $sql = "INSERT INTO productidentifier (" . $keys . ") VALUES ('" . $values . "')" . PHP_EOL;
        $conn->query($sql);
    }
}

function save_barcodes($barcode_xml, $product_id)
{
    $conn = new Database();
    /*
    x312    v3.0: barcode - BarcodeType
    x313    v3.0: barcode - PositionOnProduct
     */
    foreach ($barcode_xml as $key => $value) {
        $x312 = (string) $value->x312;
        $x313 = (string) $value->x313;

        $sql = "SELECT * FROM barcodes
                WHERE x312 = '" . $x312 . "'
                AND x313 = '" . $x313 . "'
                AND product_id = '" . $product_id . "'";
        $find_barcode = $conn->select($sql);
        if ($find_barcode->num_rows > 0) {
            continue;
        }

        $barcode = [
            'x312' => $x312,
            'x313' => $x313,
            'product_id' => $product_id,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        $keys = implode(', ', array_keys($barcode));
        $values = implode("', '", array_values($barcode));

        $sql = "INSERT INTO barcodes (" . $keys . ") VALUES ('" . $values . "')" . PHP_EOL;
        $conn->query($sql);
    }
}
