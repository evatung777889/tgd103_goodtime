<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$newid = $_POST["newid"];
$productspec1 = $_POST["productspec1"];

$pdo = connectDB();
$sql = "INSERT INTO PRODUCT_SPEC
(`SPEC`, `FK_PRODUCT_SPEC_PRODUCT_ID`) 
VALUES (?,?)";
$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $productspec1);
$statement->bindValue(2 , $newid);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>