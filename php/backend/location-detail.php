<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$id = $_POST["id"];

$pdo = connectDB();
$sql = "SELECT * FROM `LOCATION` where ID = ?";
$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $id);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>