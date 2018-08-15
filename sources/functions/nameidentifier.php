<?php

function save_nameidentifier($xml)
{
    $conn = new Database();
    $table = 'nameidentifiers';
    /*
    x415            NameIDType
    b233            IDTypeName
    b244            IDValue
     */
    foreach ($xml as $key => $value) {
        $x415 = (string) $value->x415;
        $b233 = (string) $value->b233;
        $b244 = (string) $value->b244;

        $sql = "SELECT * FROM " . $table . "
                WHERE x415 = '" . $x415 . "'
                AND b244 = '" . $b244 . "'";
        $sql .= check_empty('b233', $b233);

        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'x415' => $x415,
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