<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$pdo = connectDB();
$sql = "SELECT * FROM EXPO";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>