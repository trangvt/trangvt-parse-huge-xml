<?php

function save_product($xml)
{
    $conn = new Database();
    $table = 'products';
    /*
    a001    RecordReference
    a002    NotificationType
    a194    RecordSourceType
    a197    RecordSourceName
    a198    DeletionText
    a199    DeletionText
     */
    $a001 = (string) $xml->a001;
    $a002 = (string) $xml->a002;
    $a194 = (string) $xml->a194;
    $a195 = (string) $xml->a195;
    $a196 = (string) $xml->a196;
    $a197 = (string) $xml->a197;
    $a198 = (string) $xml->a198;
    $a199 = (string) $xml->a199;
    $b246 = (string) $xml->b246;
    $b225 = (string) $xml->b225;
    $b014 = (string) $xml->b014;
    $b210 = (string) $xml->b210;
    $b384 = (string) $xml->b384;
    $b385 = (string) $xml->b385;
    $data = [
        'a001' => $a001,
        'a002' => $a002,
        'created_at' => date("Y-m-d H:i:s"),
        'updated_at' => date("Y-m-d H:i:s")
    ];

    if (!empty($a194)) {
        $data += ['a194' => $a194];
    }
    if (!empty($a195)) {
        $data += ['a195' => $a195];
    }
    if (!empty($a196)) {
        $data += ['a196' => $a196];
    } 
    if (!empty($a197)) {
        $data += ['a197' => $a197];
    } 
    if (!empty($a198)) {
        $data += ['a198' => $a198];
    }
    if (!empty($a199)) {
        $data += ['a199' => $a199];
    }
    if (!empty($b246)) {
        $data += ['b246' => $b246];
    }
    if (!empty($b225)) {
        $data += ['b225' => $b225];
    }
    if (!empty($b014)) {
        $data += ['b014' => $b014];
    }
    if (!empty($b210)) {
        $data += ['b210' => $b210];
    }
    if (!empty($b384)) {
        $data += ['b384' => $b384];
    }
    if (!empty($b385)) {
        $data += ['b385' => $b385];
    }

    $conn->insert($table, $data);
}

function save_productform($xml)
{
    $conn = new Database();
    $table = 'productforms';

    $a001 = (string) $xml->a001;
    $b012 = (string) $xml->b012;
    $b233 = (string) $xml->b233;

    $sql = "SELECT * FROM " . $table . "
                WHERE a001 = '" . $a001 . "'";
    $sql .= check_empty('b012' , $b012);
    $sql .= check_empty('b233' , $b233);

    $find_resutl = $conn->select($sql);
    if (empty($find_resutl)) {
        $data = [
            'a001' => $a001,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        if (!empty($b012)) {
            $data += ['b012' => $b012];
        }
        if (!empty($b233)) {
            $data += ['b233' => $b233];
        }

        $conn->insert($table, $data);
    }
}

function save_product_productformfeature($xml)
{
    $conn = new Database();
    $table = 'product_productformfeature';

    $a001 = (string) $xml->a001;
    foreach ($xml as $key => $value) {
        if ($key == 'productformfeature') {
            $b334 = (string) $value->b334;
            $b335 = (string) $value->b335;
            $b336 = (string) $value->b336;

            $sql = "SELECT * FROM productformfeatures
                    WHERE b334 = '" . $b334 . "'";
            $sql .= check_empty('b335' , $b335);
            $sql .= check_empty('b336' , $b336);

            $find_resutl = $conn->select($sql);
            $productformfeature = $find_resutl->fetch_array();
            $productformfeature_id = $productformfeature['id'];

            $sql = "SELECT * FROM " . $table . "
                    WHERE a001 = '" . $a001 . "'
                    AND productformfeature_id = '" . $productformfeature_id . "'";
            if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
                continue;
            }

            $data = [
                'a001' => $a001,
                'productformfeature_id' => $productformfeature_id,
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s")
            ];

            $conn->insert($table, $data);
        }
    }
}