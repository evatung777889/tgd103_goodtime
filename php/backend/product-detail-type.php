<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM PRODUCT_TYPE";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>