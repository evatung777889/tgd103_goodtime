<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$locationname = $_POST["locationname"];
$locationdesc = $_POST["locationdesc"];
$locationstatus = $_POST["locationstatus"];
$locationprice = $_POST["locationprice"];
$locationdevice = $_POST["locationdevice"];
$locationparea = $_POST["locationparea"];
$locationrule = $_POST["locationrule"];
$locationpic = $_POST["locationpic"];

$id = $_POST["id"];

$pdo = connectDB();
$sql = "UPDATE `LOCATION` SET 
`NAME` = ?,
PRICE = ?,
`DESC` = ?,
DEVICE = ?,
RULE = ?,
AREA = ?,
MAIN_PHOTO = ?,
`STATUS` = ?
where ID = ?";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $locationname);
$statement->bindValue(2 , $locationprice);
$statement->bindValue(3 , $locationdesc);
$statement->bindValue(4 , $locationdevice);
$statement->bindValue(5 , $locationrule);
$statement->bindValue(6 , $locationparea);
$statement->bindValue(7 , '../img/rental/'.$locationpic);
$statement->bindValue(8 , $locationstatus);


$statement->bindValue(9 , $id);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>