<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$newsname = $_POST["newsname"];
$newskind = $_POST["newskind"];
$newsstart = $_POST["newsstart"];
$newsend = $_POST["newsend"];
$newsstatus = $_POST["newsstatus"];
$newscontent = $_POST["newscontent"];
$newspic = $_POST["newspic"];

$id = $_POST["id"];

$pdo = connectDB();
$sql = "UPDATE INFO SET 
TITLE = ?,
CONTENT = ?,
MAIN_PHOTO = ?,
`STATUS` = ?,
EDIT_DATE = NOW(),
FK_INFO_TYPE_ID = ?,
`START` = ?,
`END` = ?
where ID = ?";

$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $newsname);
$statement->bindValue(2 , $newscontent);
$statement->bindValue(3 , '../img/new/'.$newspic);
$statement->bindValue(4 , $newsstatus);
$statement->bindValue(5 , $newskind);
$statement->bindValue(6 , $newsstart);
$statement->bindValue(7 , $newsend);

$statement->bindValue(8 , $id);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?>