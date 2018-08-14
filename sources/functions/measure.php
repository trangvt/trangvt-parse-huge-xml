<?php

function save_measures($xml, $a001)
{
    $conn = new Database();
    $table = 'measures';
    /*
    x315    v3.0 descriptivedetail->measure -
    c094    v3.0 descriptivedetail->measure -
    c095    v3.0 descriptivedetail->measure -
     */
    
    foreach ($xml as $key => $value) {
        $x315 = (string) $value->x315;
        $c094 = (string) $value->c094;
        $c095 = (string) $value->c095;

        $sql = "SELECT * FROM " . $table . "
                WHERE a001 = '" . $a001 . "'
                AND x315 = '" . $x315 . "'
                AND c094 = '" . $c094 . "'
                AND c095 = '" . $c095 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'a001' => $a001,
            'x315' => $x315,
            'c094' => $c094,
            'c095' => $c095,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}