<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM CONTACT_US order by ID desc";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>