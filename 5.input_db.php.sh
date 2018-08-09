#!/usr/bin/php
<?php
# Create log file
$error_log = 'error.log';
if (!file_exists($error_log)) {
    $fh = fopen($error_log, 'a+');
    fclose($fh);
    chmod($error_log, 0777);
}

$log_file = fopen( $error_log, "a" );

# connect DB
$servername = "localhost";
$username = "root";
$password = "root";
// $dbname = "ipt.local";
$dbname = "tpl.local";
$table = 'products';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    fwrite($log_file, date("Y-m-d H:i:s").'Connection failed '. $conn->connect_error . PHP_EOL);
}

# Convert XML Object to Array
function XMLOject2Array($key, $value)
{
    $array_value = [];
    foreach ($value as $child_key => $child_value ) {
        if (!empty(trim((string) $child_value))) {
            $array_value[$child_key] = htmlspecialchars(htmlspecialchars_decode((string) $child_value));
        } else {
            $array_value[$child_key][] = [$child_value];
            XMLOject2Array($child_key, $child_value);
        }
    }
    return $array_value;
}

# Read files in folder
$folder_name = 'xml2/';
$xml_files = glob($folder_name.'*.xml');
foreach($xml_files as $xml_file) {
    if (!file_exists($xml_file)) {
        fwrite($log_file, date("Y-m-d H:i:s").' Failed to open file '. $xml_file . PHP_EOL);
        continue;
    }
    $product = [];
    $xml = simplexml_load_file($xml_file);
    foreach ($xml as $key => $value) {
        if (!empty(trim((string) $value))) {
            # Tag doesnt have child tags
            $product[$key][] = (string) $value;
        } else {
            $array_value = XMLOject2Array($key, $value);
            $product[$key][] = json_encode($array_value);
        }
    }
    $product['created_at'] = [date("Y-m-d H:i:s")];
    $product['updated_at'] = [date("Y-m-d H:i:s")];

    $fields= [];
    $values= [];
    foreach ($product as $field => $data) {
        $fields[] = $field;
        if (count($data) != 1) {
            $values[] = json_encode($data);
        } else {
            $values[]=$data[0];
        }
    }

    $sql = "INSERT INTO " . $table . " (".implode(', ', $fields).") VALUES ('".implode("','", $values)."')";
    if (!$conn->query($sql)) {
        fwrite($log_file, date("Y-m-d H:i:s").' Error '. $sql . PHP_EOL . $conn->error . PHP_EOL);
    }
}

fclose($log_file);