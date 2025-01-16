<?php
// db_connect.php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=fms_db', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>
