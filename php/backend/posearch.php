<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$mainid = $_POST["mainid"];
$podid = $_POST["podid"];
$membername = $_POST["membername"];
$status = $_POST["status"];
$starttime = $_POST["starttime"];
$endtime = $_POST["endtime"];
$starttime2 = $_POST["starttime2"];
$endtime2 = $_POST["endtime2"];

$pdo = connectDB();
$sql = "SELECT * FROM b_po_test where ID like ? and PODID LIKE ? and USERNAME LIKE ? and `STATUS` LIKE ? 
and CREATE_DATE BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d') 
and ETD BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d') order by ID";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , '%'.$mainid.'%');
$statement->bindValue(2 , '%'.$podid.'%');
$statement->bindValue(3 , '%'.$membername.'%');
$statement->bindValue(4 , $status);
$statement->bindValue(5 , $starttime.'%');
$statement->bindValue(6 , $endtime.'%');
$statement->bindValue(7 , $starttime2);
$statement->bindValue(8 , $endtime2);

$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);

?>