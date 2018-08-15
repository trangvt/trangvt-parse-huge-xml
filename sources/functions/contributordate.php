<?php

function save_contributordate($xml)
{
    $conn = new Database();
    $table = 'contributordates';
    /*
    x417            ContributorDateRole
    b306            Date 
     */
    foreach ($xml as $key => $value) {
        $x417 = (string) $value->x417;
        $b306 = (string) $value->b306;

        $sql = "SELECT * FROM " . $table . "
                WHERE x417 = '" . $x417 . "'
                AND b306 = '" . $b306 . "'";

        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'x417' => $x417,
            'b306' => $b306,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}