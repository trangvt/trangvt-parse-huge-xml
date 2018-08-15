<?php

function save_measure($xml, $a001)
{
    $conn = new Database();
    $table = 'measures';
    /*
    x315    v3.0 descriptivedetail->measure -
    c093
    c094    v3.0 descriptivedetail->measure -
    c095    v3.0 descriptivedetail->measure -
     */
    
    foreach ($xml as $key => $value) {
        $x315 = (string) $value->x315;
        $c093 = (string) $value->c093;
        $c094 = (string) $value->c094;
        $c095 = (string) $value->c095;

        $sql = "SELECT * FROM " . $table . "
                WHERE a001 = '" . $a001 . "'
                AND c095 = '" . $c095 . "'";
        $sql .= check_empty('x315', $x315);
        $sql .= check_empty('c093', $c093);
        $sql .= check_empty('c094', $c094);
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'a001' => $a001,
            'c095' => $c095,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        if (!empty($x315)) {
            $data += ['x315' => $x315];
        }
        if (!empty($c093)) {
            $data += ['c093' => $c093];
        }
        if (!empty($c094)) {
            $data += ['c094' => $c094];
        }

        $conn->insert($table, $data);
    }
}