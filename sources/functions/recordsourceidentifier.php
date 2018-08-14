<?php

function save_recordsourceidentifiers($xml, $a001)
{
    $conn = new Database();
    $table = 'recordsourceidentifiers';
    /*
    x311    v3.0: recordsourceidentifier - RecordSourceIDType
    b233    v3.0: recordsourceidentifier - IDTypeName
    b244    v3.0: recordsourceidentifier - IDValue
     */
    
    foreach ($xml as $key => $value) {
        $x311 = (string) $value->x311;
        $b233 = (string) $value->b233;
        $b244 = (string) $value->b244;

        $sql = "SELECT * FROM " . $table . "
                WHERE a001 = '" . $a001 . "'
                AND x311 = '" . $x311 . "'
                AND b233 = '" . $b233 . "'
                AND b244 = '" . $b244 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'a001' => $a001,
            'x311' => $x311,
            'b233' => $b233,
            'b244' => $b244,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}