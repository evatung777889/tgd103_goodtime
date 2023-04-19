<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM PO ";
// where date( STATUS_DATE ) = date(now())
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>