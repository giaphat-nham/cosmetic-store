<?php
class DatabaseConnection
{
    private $host;
    private $username;
    private $password;
    private $db;
    private $conn;

    public function __construct($host, $username, $password, $db)
    {
        $this->host = $host;
        $this->username = $username;
        $this->password = $password;
        $this->db = $db;
    }

    public function connect()
    {
        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->db);
        //check connection
        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }
    public function close()
    {
        $this->conn->close();
    }

}
?>