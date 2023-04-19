<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$memberkind = $_POST["memberkind"];
$memberverify = $_POST["memberverify"];
$memberid = $_POST["memberid"];
$membername = $_POST["membername"];

$pdo = connectDB();
$sql = "SELECT * FROM `MEMBER` where ID like ? and USERNAME LIKE ? and FK_ROLE_ID LIKE ? and VERIFY LIKE ? order by ID";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , '%'.$memberid.'%');
$statement->bindValue(2 , '%'.$membername.'%');
$statement->bindValue(3 , $memberkind);
$statement->bindValue(4 , $memberverify);

$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);

?>