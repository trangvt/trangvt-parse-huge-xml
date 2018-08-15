<?php
function check_empty($name, $value)
{
    $sql = '';
    if (empty($value)) {
        $sql .= " AND " . $name . " IS NULL";
    } else {
        $sql .= " AND " . $name . " = '" . $value ."'";
    }

    return $sql;
}