<?php

function save_descriptivedetails($xml, $a001)
{
    $conn = new Database();
    $table = 'descriptivedetails';
    /*
    x314    v3.0 descriptivedetail - ProductComposition
    b012    v3.0 descriptivedetail - ProductForm
    b333    v3.0 descriptivedetail - ProductFormDetail
    b225    v3.0 descriptivedetail - 
    b014    v3.0 descriptivedetail - 
    b384    v3.0 descriptivedetail - 
    x416    v3.0 descriptivedetail - 
    b385    v3.0 descriptivedetail - 
    x316
    x317
    b063
    x411
    b368
    b369
    b370
    b049
    n339
    x419
    b057
    b217
    b058
    n386
    x422
    b125
    b062
    b207
     */
    
    foreach ($xml as $key => $value) {
        $b012 = (string) $value->b012;
        $b333 = (string) $value->b333;
        $b225 = (string) $value->b225;
        $b014 = (string) $value->b014;
        $b384 = (string) $value->b384;
        $x416 = (string) $value->x416;
        $b385 = (string) $value->b385;
        $x316 = (string) $value->x316;
        $x317 = (string) $value->x317;
        $b063 = (string) $value->b063;
        $x411 = (string) $value->x411;
        $b368 = (string) $value->b368;
        $b369 = (string) $value->b369;
        $b370 = (string) $value->b370;
        $b049 = (string) $value->b049;
        $n339 = (string) $value->n339;
        $x419 = (string) $value->x419;

        $sql = "SELECT * FROM " . $table . "
                WHERE a001 = '" . $a001 . "'
                AND b012 = '" . $b012 . "'
                AND b333 = '" . $b333 . "'
                AND b225 = '" . $b225 . "'
                AND b014 = '" . $b014 . "'
                AND b384 = '" . $b384 . "'
                AND x416 = '" . $x416 . "'
                AND b385 = '" . $b385 . "'
                AND x316 = '" . $x316 . "'
                AND x317 = '" . $x317 . "'
                AND b063 = '" . $b063 . "'
                AND x411 = '" . $x411 . "'
                AND b368 = '" . $b368 . "'
                AND b369 = '" . $b369 . "'
                AND b370 = '" . $b370 . "'
                AND b049 = '" . $b049 . "'
                AND n339 = '" . $n339 . "'
                AND x419 = '" . $x419 . "'
                AND b333 = '" . $x . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'a001' => $a001,
            'b012' => $b012,
            'b333' => $b333,
            'b225' => $b225,
            'b014' => $b014,
            'b384' => $b384,
            'x416' => $x416,
            'b385' => $b385,
            'x316' => $x316,
            'x317' => $x317,
            'b063' => $b063,
            'x411' => $x411,
            'b368' => $b368,
            'b369' => $b369,
            'b370' => $b370,
            'b049' => $b049,
            'n339' => $n339,
            'x419' => $x419,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        // $conn->insert($table, $data);
    }
}