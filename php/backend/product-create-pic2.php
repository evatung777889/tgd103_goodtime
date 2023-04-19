<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$newid = $_POST["newid"];
$productpic2 = $_POST["productpic2"];

$pdo = connectDB();
$sql = "INSERT INTO PRODUCT_PIC
(`PATH`, `FK_PRODUCT_PIC_PRODUCT_ID`) 
VALUES (?,?)";
$statement = $pdo->prepare($sql);
$statement->bindValue(1 , '../img/product_detail/'.$productpic2);
$statement->bindValue(2 , $newid);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>