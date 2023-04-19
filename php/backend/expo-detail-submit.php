<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$exponame = $_POST["exponame"];
$expocontent = $_POST["expocontent"];
$expostart = $_POST["expostart"];
$expoend = $_POST["expoend"];
$expostatus = $_POST["expostatus"];
$adultprice = $_POST["adultprice"];
$concprice = $_POST["concprice"];
$groupprice = $_POST["groupprice"];
$expopic = $_POST["expopic"];


$id = $_POST["id"];

$pdo = connectDB();
$sql = "UPDATE EXPO SET 
TITLE = ?,
CONTENT = ?,
MAIN_PHOTO = ?,
`STATUS` = ?,
EDIT_DATE = NOW(),
`START_DATE` = ?,
END_DATE = ?,
ADULT_PRICE = ?,
CONC_PRICE = ?,
GROUP_PRICE = ?
where ID = ?";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $exponame);
$statement->bindValue(2 , $expocontent);
$statement->bindValue(3 , '../img/event_detail/'.$expopic);
$statement->bindValue(4 , $expostatus);
$statement->bindValue(5 , $expostart);
$statement->bindValue(6 , $expoend);
$statement->bindValue(7 , $adultprice);
$statement->bindValue(8 , $concprice);
$statement->bindValue(9 , $groupprice);

$statement->bindValue(10 , $id);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>