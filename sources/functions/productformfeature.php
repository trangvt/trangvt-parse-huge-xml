<?php

function save_productformfeatures($xml)
{
    $conn = new Database();
    $table = 'productformfeatures';
    /*
    b334 v3.0 descriptivedetail->productformfeature - 
    b335 v3.0 descriptivedetail->productformfeature - 
    b336 v3.0 descriptivedetail->productformfeature - 
     */

    foreach ($xml as $key => $value) {
        $b334 = (string) $value->b334;
        $b335 = (string) $value->b335;
        $b336 = (string) $value->b336;

        # Has more than 1 tag
        if (count($value->b336) > 1) {
        }

        $sql = "SELECT * FROM " . $table . "
                WHERE b334 = '" . $b334 . "'
                AND b335 = '" . $b335 . "'
                AND b336 = '" . $b336 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'b334' => $b334,
            'b335' => $b335,
            'b336' => $b336,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}