<?php

/**
 * 
 */
class Database
{
    private $servername;
    private $username;
    private $password;
    private $dbname;

    function __construct()
    {
        $this->servername = "localhost";
        $this->username = "root";
        $this->password = "";
        $this->dbname = "tpl";

        $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
        if ($conn->connect_error) {
            echo 'error';
            // fwrite($log_file, date("Y-m-d H:i:s").'Connection failed '. $conn->connect_error . PHP_EOL);
        } else {
            // return $conn;
        }
    }
}