<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$subid = $_POST["subid"];

$pdo = connectDB();
$sql = "SELECT * FROM b_po_test where PODID = ?";
$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $subid);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>