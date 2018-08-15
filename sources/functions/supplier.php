<?php

function save_supplier($xml)
{
    $conn = new Database();
    $table = 'suppliers';
    /*
    j292
    j137
     */
    
    foreach ($xml as $key => $value) {
        $j345 = (string) $value->j345;
        $b233 = (string) $value->b233;
        $b244 = (string) $value->b244;

        $sql = "SELECT * FROM " . $table . "
                WHERE j345 = '" . $j345 . "'
                AND b244 = '" . $b244 . "'";
        $sql .= check_empty('b233' , $b233);

        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'j345' => $j345,
            'b244' => $b244,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        if (!empty($b233)) {
            $data += ['b233' => $b233];
        }

        $conn->insert($table, $data);
    }
}