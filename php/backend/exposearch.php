<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$exponame = $_POST["exponame"];
$expoid = $_POST["expoid"];
$expostatus = $_POST["expostatus"];
$expostart = $_POST["expostart"];
$expoend = $_POST["expoend"];

$pdo = connectDB();
$sql = "SELECT * FROM EXPO where ID like ? and TITLE LIKE ? and `STATUS` LIKE ? and `START_DATE` BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d') and END_DATE BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d')";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , '%'.$expoid.'%');
$statement->bindValue(2 , '%'.$exponame.'%');
$statement->bindValue(3 , $expostatus);
$statement->bindValue(4 , $expostart);
$statement->bindValue(5 , $expoend);
$statement->bindValue(6 , $expostart);
$statement->bindValue(7 , $expoend);

$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);

?>