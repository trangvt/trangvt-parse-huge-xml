<?php

function save_website($xml)
{
    $conn = new Database();
    $table = 'websites';
    /*
    b367
    b294
    b295
     */
    foreach ($xml as $key => $value) {
        $b367 = (string) $value->b367;
        $b294 = (string) $value->b294;
        $b295 = (string) $value->b295;

        $sql = "SELECT * FROM " . $table . "
                WHERE b295 = '" . $b295 . "'";
        $sql .= check_empty('b367' , $b367);
        $sql .= check_empty('b294' , $b294);

        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'b295' => $b295,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        if (!empty($b367)) {
            $data += ['b367' => $b367];
        }
        if (!empty($b294)) {
            $data += ['b294' => $b294];
        }

        $conn->insert($table, $data);
    }
}