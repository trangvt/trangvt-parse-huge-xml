<?php

function save_containeditem($xml)
{
    $conn = new Database();
    $table = 'containeditems';
    /*
    b034            SequenceNumber
    x409            TitleElementLevel
    x410            PartNumber
    b020            YearOfAnnual
    b203            TitleText
    b030            TitlePrefix
    x501            NoPrefix
    b031            TitleWithoutPrefix
    b029            Subtitle
     */
    foreach ($xml as $key => $value) {
        $b034 = (string) $value->b034;
        $x409 = (string) $value->x409;
        $x410 = (string) $value->x410;
        $b020 = (string) $value->b020;
        $b203 = (string) $value->b203;
        $b030 = (string) $value->b030;
        $x501 = $value->x501 ? 1 : 0;;
        $b031 = (string) $value->b031;
        $b029 = (string) $value->b029;

        $sql = "SELECT * FROM " . $table . "
                WHERE x409 = '" . $x409 . "'";
        $sql .= check_empty('b034' , $b034);
        $sql .= check_empty('x410' , $x410);
        $sql .= check_empty('b020' , $b020);
        $sql .= check_empty('b203' , $b203);
        $sql .= check_empty('b030' , $b030);
        $sql .= check_empty('x501' , $x501);
        $sql .= check_empty('b031' , $b031);
        $sql .= check_empty('b029' , $b029);

        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'x409' => $x409,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        if (!empty($b034)) {
            $data += ['b034' => $b034];
        }
        if (!empty($x410)) {
            $data += ['x410' => $x410];
        } 
        if (!empty($b020)) {
            $data += ['b020' => $b020];
        } 
        if (!empty($b203)) {
            $data += ['b203' => $b203];
        } 
        if (!empty($b030)) {
            $data += ['b030' => $b030];
        } 
        if (!empty($x501)) {
            $data += ['x501' => $x501];
        } 
        if (!empty($b031)) {
            $data += ['b031' => $b031];
        } 
        if (!empty($b029)) {
            $data += ['b029' => $b029];
        }        

        $conn->insert($table, $data);
    }
}