<?php

function save_productparts($xml, $a001)
{
    $conn = new Database();
    $table = 'productparts';
    /*
    x457 v3.0 descriptivedetail->productpart - 
    b012 v3.0 descriptivedetail->productpart - 
    b333 v3.0 descriptivedetail->productpart - 
    b225 v3.0 descriptivedetail->productpart - 
    b014 v3.0 descriptivedetail->productpart - 
    b385 v3.0 descriptivedetail->productpart - 
    x322 v3.0 descriptivedetail->productpart - 
    x323 v3.0 descriptivedetail->productpart - 
    x316 v3.0 descriptivedetail->productpart - 
     */
    
    foreach ($xml as $key => $value) {
        $x457 = (string) $value->x457;
        $b012 = (string) $value->b012;
        $b333 = json_encode($value->b333);
        $b225 = (string) $value->b225;
        $b014 = json_encode($value->b014);
        $b385 = json_encode($value->b385);
        $x322 = (string) $value->x322;
        $x323 = (string) $value->x323;
        $x316 = (string) $value->x316;

        $sql = "SELECT * FROM " . $table . "
                WHERE a001 = '" . $a001 . "'
                AND x457 = '" . $x457 . "'
                AND b012 = '" . $b012 . "'
                AND b333 = '" . $b333 . "'
                AND b225 = '" . $b225 . "'
                AND b014 = '" . $b014 . "'
                AND b385 = '" . $b385 . "'
                AND x322 = '" . $x322 . "'
                AND x323 = '" . $x323 . "'
                AND x316 = '" . $x316 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'a001' => $a001,
            'x457' => $x457,
            'b012' => $b012,
            'b333' => $b333,
            'b225' => $b225,
            'b014' => $b014,
            'b385' => $b385,
            'x322' => $x322,
            'x323' => $x323,
            'x316' => $x316,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}