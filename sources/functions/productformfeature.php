<?php

function save_productformfeature($xml)
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

        $sql = "SELECT * FROM " . $table . "
                WHERE b334 = '" . $b334 . "'";
        $sql .= check_empty('b335' , $b335);
        $sql .= check_empty('b336' , $b336);

        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'b334' => $b334,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        if (!empty($b335)) {
            $data += ['b335' => $b335];
        }
        if (!empty($b336)) {
            $data += ['b336' => $b336];
        }
        $conn->insert($table, $data);
    }
}