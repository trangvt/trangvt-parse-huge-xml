<?php

function save_productclassification($xml, $a001)
{
    $conn = new Database();
    $table = 'productclassifications';
    /*
    b274    v3.0 descriptivedetail->productclassification - ProductClassificationType
    b275    v3.0 descriptivedetail->productclassification - ProductClassificationCode
    b337    v3.0 descriptivedetail->productclassification - Percent
     */
    
    foreach ($xml as $key => $value) {
        $b274 = (string) $value->b274;
        $b275 = (string) $value->b275;
        $b337 = (string) $value->b337;

        $sql = "SELECT * FROM " . $table . "
                WHERE a001 = '" . $a001 . "'
                AND b274 = '" . $b274 . "'
                AND b275 = '" . $b275 . "'
                AND b337 = '" . $b337 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'a001' => $a001,
            'b274' => $b274,
            'b275' => $b275,
            'b337' => $b337,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}