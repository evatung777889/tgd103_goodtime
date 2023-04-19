<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM EXPO where `STATUS` = 1 order by ID desc";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>