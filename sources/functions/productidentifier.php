<?php

function save_productidentifiers($xml)
{
    $conn = new Database();
    $table = 'productidentifiers';
    /*
    b221    v3.0: productidentifier - ProductIDType
            v2.1: productidentifier - ProductIDType
    b233	v3.0: productidentifier - IDTypeName
    b244    v3.0: productidentifier - IDValue
            v2.1: productidentifier - IDValue
    b246    v2.1: productidentifier - Barcode
     */
    foreach ($xml as $key => $value) {
        $b221 = (string) $value->b221;
        $b233 = (string) $value->b233;
        $b244 = (string) $value->b244;

        $sql = "SELECT * FROM " . $table . "
                WHERE b221 = '" . $b221 . "'
                AND b233 = '" . $b233 . "'
                AND b244 = '" . $b244 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'b221' => $b221,
            'b233' => $b233,
            'b244' => $b244,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}