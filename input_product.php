<?php

require 'Database.php';

$conn = new Database();
$sql = "INSERT INTO";
    if (!$conn->query($sql)) {
        // fwrite($log_file, date("Y-m-d H:i:s").' Error '. $sql . PHP_EOL . $conn->error . PHP_EOL);
    }