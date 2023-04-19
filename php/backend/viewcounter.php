<?php
include("../connect.php");

$pdo = connectDB();

$sql = "INSERT INTO `COUNTER` (`POINT`,`DATE`) 
VALUES (1, now())";

$statement = $pdo->prepare($sql);
$statement->execute();


//導頁    
echo "";
// echo $mainphoto;
// echo $res
?>