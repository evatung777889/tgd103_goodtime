<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$productpic = $_POST["productpic"];
$productname = $_POST["productname"];
$startdate = $_POST["startdate"];
$enddate = $_POST["enddate"];
$productpage = $_POST["productpage"];
$productprice = $_POST["productprice"];
$hide = $_POST["hide"];
$eventname = $_POST["eventname"];
$productnum = $_POST["productnum"];
$productdetail = $_POST["productdetail"];
$producttype = $_POST["producttype"];
$productinfo1 = $_POST["productinfo1"];
$productinfo2 = $_POST["productinfo2"];
$productinfo3 = $_POST["productinfo3"];
// $res = ($productname,$productpage,$hide,$productprice,$productdetail,$mainphoto,$productnum,now(),now(),$producttag,$eventnum);
$pdo = connectDB();
$sql = "INSERT INTO PRODUCT
(`PRODUCT_NAME`, `STATUS`, HIDE, PRICE, `DESC`, MAIN_PHOTO, STOCK_QTY, MAX_QTY, CREATE_DATE, EDIT_DATE, FK_PRODUCT_PAGE_ID, FK_EXPO_ID, FK_PRODUCT_TYPE_ID, SPEC, NOTE, FEATURED, `START`, `END`) 
VALUES (?,?,?,?,?,?,?,10,NOW(),NOW(),2,?,?,?,?,?,?,?)";
// $sql = "INSERT INTO PRODUCT(`PRODUCT_NAME`, `STATUS`, HIDE, PRICE, `DESC`, MAIN_PHOTO, STOCK_QTY, CREATE_DATE, EDIT_DATE, FK_PRODUCT_PAGE_ID,FK_PRODUCT_EXPO_ID) VALUES ?";
$statement = $pdo->prepare($sql);
// $statement->bindValue(1 , $res); 
$statement->bindValue(1 , $productname); 
$statement->bindValue(2 , $productpage);
$statement->bindValue(3 , $hide); 
$statement->bindValue(4 , $productprice);
$statement->bindValue(5 , $productdetail); 
$statement->bindValue(6 , '../img/product_detail/'.$productpic);
$statement->bindValue(7 , $productnum);
$statement->bindValue(8 , $eventname);
$statement->bindValue(9 , $producttype);
$statement->bindValue(10 , '產品名稱:'.$productinfo1);
$statement->bindValue(11 , $productinfo2);
$statement->bindValue(12 , $productinfo3);
$statement->bindValue(13 , $startdate);
$statement->bindValue(14 , $enddate);
$statement->execute();
$id = $pdo->lastInsertId();
$data = $statement->fetchAll();


//導頁    
echo json_encode($id);
// echo $mainphoto;
// echo $res
?>