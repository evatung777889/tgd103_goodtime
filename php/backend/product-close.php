<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$idvalue = $_POST["idvalue"];

$pdo = connectDB();
$sql = "UPDATE PRODUCT SET `STATUS` = 2 where ID = ?";
$statement = $pdo->prepare($sql);
$statement->bindValue(1, $idvalue);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>