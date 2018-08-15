<?php

function save_collectionidentifier($xml)
{
    $conn = new Database();
    $table = 'collectionidentifiers';
    /*
    x344            CollectionIDType
    b233            IDTypeName
    b244            IDValue
     */
    foreach ($xml as $key => $value) {
        $x344 = (string) $value->x344;
        $b233 = (string) $value->b233;
        $b244 = (string) $value->b244;

        $sql = "SELECT * FROM " . $table . "
                WHERE x344 = '" . $x344 . "'
                AND b244 = '" . $b244 . "'";
        $sql .= check_empty('b233' , $b233);

        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'x344' => $x344,
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