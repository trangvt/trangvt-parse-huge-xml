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
    private $conn;

    private $error_log;

    function __construct()
    {
        $this->servername = "localhost";
        $this->username = "root";
        $this->password = "";
        $this->dbname = "ipt";
        // $this->dbname = "onix";

        $this->error_log = new SplFileObject('error.log', "a");

        $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
        if ($this->conn->connect_error) {
            $this->error_log->fwrite(date("Y-m-d H:i:s") . ' Connection failed '. $this->conn->connect_error . PHP_EOL);
            die();
        }
    }

    public function select($sql) {
        $result = $this->conn->query($sql);

        if (!$result) {
            $this->error_log->fwrite(date("Y-m-d H:i:s") . ' Error sql: '. $this->conn->error . $sql . PHP_EOL);
            return;
        }

        return $result;
    }

    public function query($sql) {
        $result = $this->conn->query($sql);

        if (!$result) {
            $this->error_log->fwrite(date("Y-m-d H:i:s") . ' Error sql: '. $this->conn->error . $sql . PHP_EOL);
            return;
        }

        return $result;
        // return $this->conn->insert_id;
    }

    public function insert($data) {
        $keys = implode(', ', array_keys($data));
        $values = implode("', '", array_values($data));

        $sql = "INSERT INTO " . $table . " (" . $keys . ") VALUES ('" . $values . "');";
        return $this->conn->query($sql);
    }
}