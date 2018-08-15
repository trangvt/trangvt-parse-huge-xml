<?php

function save_collectionsequence($xml)
{
    $conn = new Database();
    $table = 'collectionsequences';
    /*
    x479            CollectionSequenceType
    x480            CollectionSequenceTypeName
    x481            CollectionSequenceNumber
     */
    foreach ($xml as $key => $value) {
        $x479 = (string) $value->x479;
        $x480 = (string) $value->x480;
        $x481 = (string) $value->x481;

        $sql = "SELECT * FROM " . $table . "
                WHERE x479 = '" . $x479 . "'
                AND x481 = '" . $x481 . "'";
        $sql .= check_empty('x480' , $x480);

        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'x479' => $x479,
            'x481' => $x481,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        if (!empty($x480)) {
            $data += ['x480' => $x480];
        }

        $conn->insert($table, $data);
    }
}