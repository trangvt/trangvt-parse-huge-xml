<?php

function save_productpart($xml, $a001)
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
        $x457 = $value->x457 ? 1 : 0;
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
            $find_id = $find_resutl->fetch_array();
            $id = $find_id['id'];
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

        if (empty($id)) {
            $id = $conn->insert_return_id($table, $data);
        }

        foreach ($value as $k => $v) {
            switch ($k){
                case 'productidentifier':
                    $b221 = (string) $v->b221;
                    $b233 = (string) $v->b233;
                    $b244 = (string) $v->b244;
                    $b246 = (string) $v->b246;
                    $sql = "SELECT * FROM productidentifiers
                            WHERE b221 = '" . $b221 . "'
                            AND b233 = '" . $b233 . "'
                            AND b244 = '" . $b244 . "'";
                    if (empty($b246)) {
                        $sql .= "AND b246 IS NULL";
                    } else {
                        $sql .= "AND b246 = '" . $b246 . "'";
                    }
                    $find_productidentifier = $conn->select($sql);
                    $find_productidentifier_id = $find_productidentifier->fetch_array();
                    $productidentifier_id = $find_productidentifier_id['id'];

                    $sql = "SELECT * FROM productpart_productidentifier
                            WHERE productpart_id = '" . $id . "'
                            AND productidentifier_id = '" . $productidentifier_id . "'";

                    $find_resutl = $conn->select($sql);
                    if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
                        continue;
                    }

                    $productpart_productidentifier = [
                        'productpart_id' => $id,
                        'productidentifier_id' => $productidentifier_id
                    ];
                    $conn->insert('productpart_productidentifier', $productpart_productidentifier);
                    break;
                case 'productformfeature':
                    $b334 = (string) $v->b334;
                    $b335 = (string) $v->b335;
                    $b336 = (string) $v->b336;
                    $sql = "SELECT * FROM productformfeatures
                            WHERE b334 = '" . $b334 . "'
                            AND b335 = '" . $b335 . "'";
                    if (empty($b336)) {
                        $sql .= "AND b336 IS NULL";
                    } else {
                        $sql .= "AND b336 = '" . $b336 . "'";
                    }
                    $find_productformfeature = $conn->select($sql);
                    $find_productformfeature_id = $find_productformfeature->fetch_array();
                    $productformfeature_id = $find_productformfeature_id['id'];
                    $sql = "SELECT * FROM productpart_productformfeature
                            WHERE productpart_id = '" . $id . "'
                            AND productformfeature_id = '" . $productformfeature_id . "'";
                    $find_resutl = $conn->select($sql);
                    if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
                        continue;
                    }
                    $productpart_productformfeature = [
                        'productpart_id' => $id,
                        'productformfeature_id' => $productformfeature_id
                    ];
                    $conn->insert('productpart_productformfeature', $productpart_productformfeature);
                    break;
                default:
                    break;
            }
        }
    }
}
