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

    //Save productidentifier tags (v2.1 & v3.0)
    $productidentifier_xml = $xml->xpath('/product/productidentifier');
    save_productidentifier($productidentifier_xml, $product_id);

    //Save barcode tags (v3.0)
    $barcode_xml = $xml->xpath('/product/barcode');
    save_barcodes($barcode_xml, $product_id);

    // Save measure tags (v3.0)
    $measure_xml_v3 = $xml->xpath('/product/descriptivedetail/measure');
    save_measures_v3($measure_xml_v3, $product_id);

    // Save measure tags (v2.1)
    $measure_xml_v2 = $xml->xpath('/product/measure');

    // Save subject tags (v3.0)
    $subject_xml_v3 = $xml->xpath('/product/descriptivedetail/subject');
    save_subjects_v3($subject_xml_v3, $product_id);

    // Save contributor tags (v3.0)
    $contributor_xml_v3 = $xml->xpath('/product/descriptivedetail/contributor');
    save_contributors_v3($contributor_xml_v3, $product_id);

    // Save supplier tags (v3.0)
    $supplier_xml = $xml->xpath('/product/descriptivedetail/contributor');
    save_suppliers($supplier_xml, $product_id);
}


function save_productidentifier($xml, $product_id)
{
    $conn = new Database();
    $table = 'productidentifier';
    /*
    b221    v3.0: productidentifier - ProductIDType
            v2.1: productidentifier - ProductIDType
    b244    v3.0: productidentifier - IDValue
            v2.1: productidentifier - IDValue
    b246    v2.1: productidentifier - Barcode
     */
    foreach ($xml as $key => $value) {
        $b221 = (string) $value->b221;
        $b244 = (string) $value->b244;
        $b246 = isset($value->b246) ? (string) $value->b246 : NULL;

        $sql = "SELECT * FROM " . $table . "
                WHERE b221 = '" . $b221 . "'
                AND b244 = '" . $b244 . "'
                AND b246 = '" . $b246 . "'
                AND product_id = '" . $product_id . "'";
        $find_resutl = $conn->select($sql);
        if ($find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'b221' => $b221,
            'b244' => $b244,
            'b246' => $b246,
            'product_id' => $product_id,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        $keys = implode(', ', array_keys($data));
        $values = implode("', '", array_values($data));

        $sql = "INSERT INTO " . $table . " (" . $keys . ") VALUES ('" . $values . "')" . PHP_EOL;
        $conn->query($sql);
    }
}

function save_barcodes($xml, $product_id)
{
    $conn = new Database();
    $table = 'barcodes';
    /*
    x312    v3.0: barcode - BarcodeType
    x313    v3.0: barcode - PositionOnProduct
     */
    foreach ($xml as $key => $value) {
        $x312 = (string) $value->x312;
        $x313 = (string) $value->x313;

        $sql = "SELECT * FROM " . $table . "
                WHERE x312 = '" . $x312 . "'
                AND x313 = '" . $x313 . "'
                AND product_id = '" . $product_id . "'";
        $find_resutl = $conn->select($sql);
        if ($find_resutl->num_rows > 0) {
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

        $sql = "INSERT INTO " . $table . " (" . $keys . ") VALUES ('" . $values . "')" . PHP_EOL;
        $conn->query($sql);
    }
}

function save_measures_v3($xml, $product_id)
{
    $conn = new Database();
    $table = 'measures';
    /*
    x315    v3.0: descriptivedetail->measure - MeasureType
    c094    v3.0: descriptivedetail->measure - Measurement
    c095    v3.0: descriptivedetail->measure - MeasureUnitCode
     */
    foreach ($xml as $key => $value) {
        $x315 = (string) $value->x315;
        $c094 = (string) $value->c094;
        $c095 = (string) $value->c095;

        $sql = "SELECT * FROM " . $table . "
                WHERE x315 = '" . $x315 . "'
                AND c094 = '" . $c094 . "'
                AND c095 = '" . $c095 . "'
                AND product_id = '" . $product_id . "'";
        $find_resutl = $conn->select($sql);
        if ($find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'x315' => $x315,
            'c094' => $c094,
            'c095' => $c095,
            'product_id' => $product_id,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        $keys = implode(', ', array_keys($data));
        $values = implode("', '", array_values($data));

        $sql = "INSERT INTO " . $table . " (" . $keys . ") VALUES ('" . $values . "')" . PHP_EOL;
        $conn->query($sql);
    }
}

function save_contributors_v3($xml, $product_id)
{
    $conn = new Database();
    $table = 'contributors';
    $table_relation = 'product_contributor';

    /*
    b034    v3.0: descriptivedetail->contributor - SequenceNumber
    b035    v3.0: descriptivedetail->contributor - ContributorRole
    b036    v3.0: descriptivedetail->contributor - PersonName
    b037    v3.0: descriptivedetail->contributor - PersonNameInverted
    b038    v3.0: descriptivedetail->contributor - TitlesBeforeNames
    b039    v3.0: descriptivedetail->contributor - NamesBeforeKey
    b040    v3.0: descriptivedetail>contributor - KeyNames
    b041    v3.0: descriptivedetail->contributor - NamesAfterKey
     */
    foreach ($xml as $key => $value) {
        $b034 = isset($value->b034) ? (string) $value->b034 : NULL;
        $b035 = isset($value->b035) ? (string) $value->b035 : NULL;
        $b036 = isset($value->b036) ? (string) $value->b036 : NULL;
        $b037 = isset($value->b037) ? (string) $value->b037 : NULL;
        $b038 = isset($value->b038) ? (string) $value->b038 : NULL;
        $b039 = isset($value->b039) ? (string) $value->b039 : NULL;
        $b040 = isset($value->b040) ? (string) $value->b040 : NULL;
        $b041 = isset($value->b041) ? (string) $value->b041 : NULL;
        $sql = "SELECT * FROM " . $table . "
                WHERE b034 = '" . $b034 . "'
                AND b035 = '" . $b035 . "'
                AND b036 = '" . $b036 . "'
                AND b037 = '" . $b037 . "'
                AND b038 = '" . $b038 . "'
                AND b039 = '" . $b039 . "'
                AND b040 = '" . $b040 . "'
                AND b041 = '" . $b041 . "';";
        $find_resutl = $conn->select($sql);
        if ($find_resutl->num_rows > 0) {
            $row = $find_resutl->fetch_assoc();
            $id = $row["id"];
        } else {
            $data = [
                'b034' => $b034,
                'b035' => $b035,
                'b036' => $b036,
                'b037' => $b037,
                'b038' => $b038,
                'b039' => $b039,
                'b040' => $b040,
                'b041' => $b041,
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s")
            ];
            $keys = implode(', ', array_keys($data));
            $values = implode("', '", array_values($data));

            $sql = "INSERT INTO " . $table . " (" . $keys . ") VALUES ('" . $values . "')" . PHP_EOL;
            if (!isset($id)) {
                $id = $conn->query($sql);
            }
        }

        $sql_relation = "SELECT * FROM " . $table_relation . "
                WHERE product_id = '" . $product_id . "'
                AND contributor_id = '" . $id . "'";
        $find_relation = $conn->select($sql_relation);
        if ($find_relation->num_rows > 0) {
            continue;
        }
        $relation = [
            'product_id' => $product_id,
            'contributor_id' => $id,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        $keys_relation = implode(', ', array_keys($relation));
        $values_relation = implode("', '", array_values($relation));
        $sql_relation = "INSERT INTO " . $table_relation . " (" . $keys_relation . ") VALUES ('" . $values_relation . "')" . PHP_EOL;
        $conn->query($sql_relation);
    }
}

function save_suppliers($xml, $product_id)
{
    $conn = new Database();
    $table = 'suppliers';
    $table_relation = 'product_supplier';

    /*
        j292    v3.0 productsupply->supplydetail->supplier - SupplierRole
        j345    v3.0 productsupply->supplydetail->supplier - SupplierIDType
        b244    v3.0 productsupply->supplydetail->supplier - IDValue
        j137    v3.0 productsupply->supplydetail->supplier - SupplierName
     */
    foreach ($xml as $key => $value) {
        $j292 = (string) $value->j292 ? (string) $value->j292 : NULL;
        $j345 = (string) $value->j345 ? (string) $value->j345 : NULL;
        $b244 = (string) $value->b244 ? (string) $value->b244 : NULL;
        $j137 = (string) $value->j137 ? (string) $value->j137 : NULL;
        $sql = "SELECT * FROM " . $table . "
                WHERE j292 = '" . $j292 . "'
                AND j345 = '" . $j345 . "'
                AND b244 = '" . $b244 . "'
                AND j137 = '" . $j137 . "';";
        $find_resutl = $conn->select($sql);
        if ($find_resutl->num_rows > 0) {
            $row = $find_resutl->fetch_assoc();
            $id = $row["id"];
        } else {
            $data = [
                'j292' => $j292,
                'j345' => $j345,
                'b244' => $b244,
                'j137' => $j137,
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s")
            ];
            $keys = implode(', ', array_keys($data));
            $values = implode("', '", array_values($data));

            $sql = "INSERT INTO " . $table . " (" . $keys . ") VALUES ('" . $values . "');";
            if (!isset($id)) {
                $id = $conn->query($sql);
            }
        }

        $sql_relation = "SELECT * FROM " . $table_relation . "
        WHERE product_id = '" . $product_id . "'
        AND supplier_id = '" . $id . "'";
        $find_relation = $conn->select($sql_relation);
        if ($find_relation->num_rows > 0) {
            continue;
        }
        $relation = [
            'product_id' => $product_id,
            'supplier_id' => $id,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        $keys_relation = implode(', ', array_keys($relation));
        $values_relation = implode("', '", array_values($relation));
        $sql_relation = "INSERT INTO " . $table_relation . " (" . $keys_relation . ") VALUES ('" . $values_relation . "')" . PHP_EOL;
        $conn->query($sql_relation);
    }
}

function save_subjects_v3($xml, $product_id)
{
    $conn = new Database();
    $table = 'subjects';
    /*
    x425    v3.0: descriptivedetail->subject - MainSubject
    b067    v3.0: descriptivedetail->subject - SubjectSchemeIdentifier
    b068    v3.0: descriptivedetail->subject - SubjectSchemeVersion
    b069    v3.0: descriptivedetail->subject - SubjectCode
    b070    v3.0: descriptivedetail->subject - SubjectHeadingText
    b171    v3.0: descriptivedetail->subject - SubjectSchemeName
     */
    foreach ($xml as $key => $value) {
        $x425 = $value->x425 ? TRUE : FALSE;
        $b067 = (string) $value->b067;
        $b068 = (string) $value->b068 ? (string) $value->b068 : NULL;
        $b069 = (string) $value->b069 ? (string) $value->b069 : NULL;
        $b070 = (string) $value->b070 ? (string) $value->b070 : NULL;
        $b171 = (string) $value->b171 ? (string) $value->b171 : NULL;
        $sql = "SELECT * FROM " . $table . "
                WHERE x425 = '" . $x425 . "'
                AND b067 = '" . $b067 . "'
                AND b068 = '" . $b068 . "'
                AND b069 = '" . $b069 . "'
                AND b070 = '" . $b070 . "'
                AND b171 = '" . $b171 . "'
                AND product_id = '" . $product_id . "'";
        $find_resutl = $conn->select($sql);
        if ($find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'x425' => $x425,
            'b067' => $b067,
            'b068' => $b068,
            'b069' => $b069,
            'b070' => $b070,
            'b171' => $b171,
            'product_id' => $product_id,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        $keys = implode(', ', array_keys($data));
        $values = implode("', '", array_values($data));

        $sql = "INSERT INTO " . $table . " (" . $keys . ") VALUES ('" . $values . "')" . PHP_EOL;
        $conn->query($sql);
    }
}