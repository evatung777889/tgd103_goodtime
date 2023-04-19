<?php
include("../connect.php");

$newscontent = $_POST["newscontent"];
$newsname = $_POST["newsname"];
$newsstart = $_POST["newsstart"];
$newsend = $_POST["newsend"];
$newskind = $_POST["newskind"];
$newsstatus = $_POST["newsstatus"];
$newspic = $_POST["newspic"];
$pdo = connectDB();

$sql = "INSERT INTO INFO(TITLE, CONTENT, MAIN_PHOTO, `STATUS`, CREATE_DATE, EDIT_DATE, `START`, `END`, FK_INFO_PAGE_ID,FK_INFO_TYPE_ID) 
VALUES (?,?,?,?,now(),now(),?,?,1,?)";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $newsname); 
$statement->bindValue(2 , $newscontent);
$statement->bindValue(3 , '../img/new/'.$newspic); 
$statement->bindValue(4 , $newsstatus);
$statement->bindValue(5 , $newsstart); 
$statement->bindValue(6 , $newsend);
$statement->bindValue(7 , $newskind);
$statement->execute();


//導頁    
echo "新增分類成功!";
// echo $mainphoto;
// echo $res
?>