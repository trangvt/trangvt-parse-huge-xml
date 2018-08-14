<?php

function save_discountcodeds($xml)
{
    $conn = new Database();
    $table = 'discountcodeds';
    /*
    j363    v3.0 supplydetail->price->discountcoded - DiscountCodeType
    j378    v3.0 supplydetail->price->discountcoded - DiscountCodeTypeName
    j364    v3.0 supplydetail->price->discountcoded - DiscountCode
     */
    foreach ($xml as $key => $value) {
        $j363 = (string) $value->j363;
        $j378 = (string) $value->j378;
        $j364 = (string) $value->j364;

        $sql = "SELECT * FROM " . $table . "
                WHERE j363 = '" . $j363 . "'
                AND j378 = '" . $j378 . "'
                AND j364 = '" . $j364 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'j363' => $j363,
            'j378' => $j378,
            'j364' => $j364,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}