<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$newsname = $_POST["newsname"];
$newsid = $_POST["newsid"];
$newsstatus = $_POST["newsstatus"];
$newskind = $_POST["newskind"];
$newsstart = $_POST["newsstart"];
$newsend = $_POST["newsend"];

$pdo = connectDB();
$sql = "SELECT * FROM b_new where ID like ? and TITLE LIKE ? and FK_INFO_TYPE_ID LIKE ? and `STATUS` LIKE ? and `START` BETWEEN STR_TO_DATE(?, '%Y-%m-%d')AND STR_TO_DATE(?, '%Y-%m-%d') and `END` BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d')";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , '%'.$newsid.'%');
$statement->bindValue(2 , '%'.$newsname.'%');
$statement->bindValue(3 , $newskind);
$statement->bindValue(4 , $newsstatus);
$statement->bindValue(5 , $newsstart);
$statement->bindValue(6 , $newsend);
$statement->bindValue(7 , $newsstart);
$statement->bindValue(8 , $newsend);

$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);

?>