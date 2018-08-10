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
        continue;
    }

    // Parse data
    $product = [];
    $xml = simplexml_load_file($xml_file);
    /*
    a001 
    a002 
    a194 
    x314 
    b012 
    b057 
    b058 
    b083 
    x450 
    b061 v2.0: root - NumberOfPages
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
        'x450' => (string) $xml->publishingdetail->salesrights->territory->x450,
        'b061' => $xml->b061 ? (string) $xml->b061 : 0, 
        // 'created_at' => date("Y-m-d H:i:s"),
        // 'updated_at' => date("Y-m-d H:i:s")
    ];

    // Save to products table
    $keys = implode(', ', array_keys($product));
    $values = implode("', '", array_values($product));
    $sql = "INSERT INTO products (" . $keys . ") VALUES ('" . $values . "')";
    $product_id = $conn->query($sql);

    echo $product_id;
}
