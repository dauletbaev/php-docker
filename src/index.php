<?php

define('DB_HOST', 'db');
define('DB_USER', 'user');
define('DB_PASSWORD', 'examplepassword');
define('DB_NAME', 'test');

class DB {
    private static $instance = null;
    private $conn;

    private function __construct() {
        $this->conn = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME, DB_USER, DB_PASSWORD, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]);
    }

    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new self();
        }

        return self::$instance;
    }

    public function getConnection() {
        return $this->conn;
    }
}

$conn = DB::getInstance()->getConnection();

if ($conn) {
    echo "Connected to DB";
} else {
    echo "Failed to connect to DB";
}
phpinfo();
var_dump($_SERVER);
