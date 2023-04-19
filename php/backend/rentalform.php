<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM RENTAL_FORM order by ID desc";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>