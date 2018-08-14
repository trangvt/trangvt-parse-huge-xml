<?php

function save_epubusageconstraints($xml, $a001)
{
    $conn = new Database();
    $table = 'epubusageconstraints';
    /*
    x318
    x319
    epubusagelimit
        x320
        x321
     */

    foreach ($xml as $key => $value) {
        $x318 = (string) $value->x318;
        $x319 = (string) $value->x319;
        $epubusagelimit = json_encode($value->epubusagelimit);

        $sql = "SELECT * FROM " . $table . "
                WHERE a001 = '" . $a001 . "'
                AND x318 = '" . $x318 . "'
                AND x319 = '" . $x319 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'a001' => $a001,
            'x318' => $x318,
            'x319' => $x319,
            'epubusagelimit' => $epubusagelimit,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}