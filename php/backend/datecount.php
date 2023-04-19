<?php
include("../connect.php");

$pdo = connectDB();
$sql = "SELECT * FROM `COUNTER` where `DATE` = date(now())";
$statement = $pdo->prepare($sql);
$statement->execute();
$data = $statement->fetchAll();


//導頁    
echo json_encode($data);
// echo $mainphoto;
// echo $res
?>