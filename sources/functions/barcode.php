<?php

function save_barcodes($xml, $a001)
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
                WHERE a001 = '" . $a001 . "'
                AND x312 = '" . $x312 . "'
                AND x313 = '" . $x313 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'a001' => $a001,
            'x312' => $x312,
            'x313' => $x313,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}