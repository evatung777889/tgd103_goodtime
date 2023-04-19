<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$productimg2 = $_POST["productimg2"];
$id = $_POST["id"];

$pdo = connectDB();
$sql = "UPDATE PRODUCT_PIC
SET `PATH` = ?
WHERE ID IN (
	SELECT ID FROM (
        SELECT * FROM PRODUCT_PIC
        where FK_PRODUCT_PIC_PRODUCT_ID = ?
        LIMIT 1, 1
	) aaa
)";
$statement = $pdo->prepare($sql);
$statement->bindValue(1 , '../img/product_detail/'.$productimg2);
$statement->bindValue(2 , $id);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>