<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$memberverify = $_POST["memberverify"];
$memberkind = $_POST["memberkind"];

$id = $_POST["id"];

$pdo = connectDB();
$sql = "UPDATE MEMBER SET 
VERIFY = ?,
FK_ROLE_ID = ?
where ID = ?";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $memberverify);
$statement->bindValue(2 , $memberkind);

$statement->bindValue(3 , $id);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>