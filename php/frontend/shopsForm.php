<?php

include("../connect.php");
include("../verify.php");

$_POST = json_decode(file_get_contents("php://input"), true);

$shop__name = $_POST["shop__name"];
// echo "活動名稱：$activity__name<br/>";

$principal_name = $_POST["principal_name"];
// echo "申請單位:$applicant__unit<br/>";

$principal_phone = $_POST["principal_phone"];
// echo "負責人姓名：$principal__name<br/>";

$principal_email = $_POST["principal_email"];
// echo "單位類別：$unit__spacing<br/>";

$shopstay__time = $_POST["shopstay__time"];
// echo "聯絡人電話：$Contact__phone<br/>";

$Opinion = $_POST["Opinion"];
// echo "意見回饋：$Opinion<br/>";



$dbn = connectDB();
$sql = "INSERT INTO SHOPS_FORM(BRAND_NAME,PRINCIPAL_NAME,PRINCIPAL_PHONE,PRINCIPAL_EMAIL,STAY_TIME,FEEDBACK)
        VALUES(:shop__name,:principal_name,:principal_phone,:principal_email,:shopstay__time,:Opinion)";

$statement = $dbn->prepare($sql);

$statement->bindValue(":shop__name", $shop__name);
$statement->bindValue(":principal_name", $principal_name);
$statement->bindValue(":principal_phone", $principal_phone);
$statement->bindValue(":principal_email", $principal_email);
$statement->bindValue(":shopstay__time", $shopstay__time);
$statement->bindValue(":Opinion", $Opinion);

$statement->execute();

?>