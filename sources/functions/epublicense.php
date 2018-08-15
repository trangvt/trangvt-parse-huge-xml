<?php

function save_epublicenseexpressions($xml)
{
    $conn = new Database();
    $table = 'epublicenseexpressions';
    /*
    x508            EpubLicenseExpressionType
    x509            EpubLicenseExpressionTypeName
    x510            EpubLicenseExpressionLink
    */
    foreach ($xml as $key => $value) {
        $x508 = $value->x508;
        $x509 = $value->x509;
        $x510 = $value->x510;

        $sql = "SELECT * FROM " . $table . "
                WHERE x508 = '" . $x508 . "'
                AND x509 = '" . $x509 . "'
                AND x510 = '" . $x510 . "';";
        $find_resutl = $conn->select($sql);
        if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
            continue;
        }

        $data = [
            'x508' => $x508,
            'x509' => $x509,
            'x510' => $x510,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];

        $conn->insert($table, $data);
    }
}

function save_epublicenses($xml)
{
    $conn = new Database();
    $table = 'epublicenses';
    $child_table = 'epublicenseexpressions';
    /*
    x511
    language
    epublicenseexpression_id
     */

    foreach ($xml as $key => $value) {
        $x511_array = [];
        $child = [];
        foreach ($value as $k => $v) {
            switch ($k) {
                case 'x511':
                    $language = (string) $v->attributes()->language;
                    $x511_array[$language] = (string) $v;
                    break;
                case 'epublicenseexpression':
                    $child[] = [
                        'x508' => (string) $v->x508,
                        'x509' => (string) $v->x509,
                        'x510' => (string) $v->x510
                    ];
                    break;
                default:
                    break;
            }
        }

        foreach ($x511_array as $lang => $text) {
            if (!empty($child)) {
                foreach ($child as $child_key => $child_value) {
                    $sql = "SELECT id FROM " . $child_table . "
                            WHERE x508 = '" . $child_value['x508'] . "'
                            AND x509 = '" . $child_value['x509'] . "'
                            AND x510 = '" . $child_value['x510'] . "';";
                    $find_resutl = $conn->select($sql);
                    $find_id = $find_resutl->fetch_array();
                    $id = $find_id['id'];
                
                    $sql = "SELECT * FROM " . $table . "
                        WHERE x511 = '" . $text . "'
                        AND language = '" . $lang . "'
                        AND epublicenseexpression_id = '" . $id . "';";
                    $find_resutl = $conn->select($sql);
                    if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
                        continue;
                    }
                    $data = [
                        'x511' => $text,
                        'language' => $lang,
                        'epublicenseexpression_id' => $id,
                        'created_at' => date("Y-m-d H:i:s"),
                        'updated_at' => date("Y-m-d H:i:s")
                    ];

                    $conn->insert($table, $data);
                }
            } else {
                $sql = "SELECT * FROM " . $table . "
                        WHERE x511 = '" . $text . "'
                        AND language = '" . $lang . "'
                        AND epublicenseexpression_id IS NULL;";
                $find_resutl = $conn->select($sql);
                if (!empty($find_resutl) && $find_resutl->num_rows > 0) {
                    continue;
                }
                $data = [
                    'x511' => $text,
                    'language' => $lang,
                    'created_at' => date("Y-m-d H:i:s"),
                    'updated_at' => date("Y-m-d H:i:s")
                ];
                $conn->insert($table, $data);
            }
        }
    }
}