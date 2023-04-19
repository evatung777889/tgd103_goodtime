<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM b_po_test where  `STATUS` = 1";
// date( CREATE_DATE ) = date(now()) and
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>