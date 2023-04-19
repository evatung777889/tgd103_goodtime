<?php
include("../connect.php");

$exponame = $_POST["exponame"];
$expocontent = $_POST["expocontent"];
$expostart = $_POST["expostart"];
$expoend = $_POST["expoend"];
$expostatus = $_POST["expostatus"];
$adultprice = $_POST["adultprice"];
$concprice = $_POST["concprice"];
$groupprice = $_POST["groupprice"];
$expopic = $_POST["expopic"];
$pdo = connectDB();

$sql = "INSERT INTO EXPO(TITLE, CONTENT, MAIN_PHOTO, FK_EXPO_PAGE_ID, `START_DATE`, END_DATE, CREATE_DATE, EDIT_DATE, ADULT_PRICE, CONC_PRICE, GROUP_PRICE, `STATUS`) 
VALUES (?,?,?,3,?,?,now(),now(),?,?,?,?)";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $exponame); 
$statement->bindValue(2 , $expocontent);
$statement->bindValue(3 , '../img/event/'.$expopic);
$statement->bindValue(4 , $expostart);
$statement->bindValue(5 , $expoend); 
$statement->bindValue(6 , $adultprice);
$statement->bindValue(7 , $concprice);
$statement->bindValue(8 , $groupprice);
$statement->bindValue(9 , $expostatus);
$statement->execute();


//導頁    
echo "新增分類成功!";
// echo $mainphoto;
// echo $res
?>