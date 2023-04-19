<?php

include("../connect.php");
include("../verify.php");

$_POST = json_decode(file_get_contents("php://input"), true);

$activity__name = $_POST["activity__name"];
// echo "活動名稱：$activity__name<br/>";

$applicant__unit = $_POST["applicant__unit"];
// echo "申請單位:$applicant__unit<br/>";

$principal__name = $_POST["principal__name"];
// echo "負責人姓名：$principal__name<br/>";

$unit__spacing = $_POST["unit__spacing"];
// echo "單位類別：$unit__spacing<br/>";

$Contact__name = $_POST["Contact__name"];
// echo "聯絡人姓名：$Contact__name<br/>";

$Contact__phone = $_POST["Contact__phone"];
// echo "聯絡人電話：$Contact__phone<br/>";

$place__spacing = $_POST["place__spacing"];
// echo "選擇場地：$place__spacing<br/>";

$date_pick__from = $_POST["date_pick__from"];
// echo "活動開始時間：$date_pick__from<br/>";

$date_pick__to = $_POST["date_pick__to"];
// echo "活動結束時間：$date_pick__to<br/>";

$nature__activity = $_POST["nature__activity"];
$arr__nature__activity = implode(",", $nature__activity);
// echo "活動性質：$arr__nature__activity<br/>";

$ornamental__nature = $_POST["ornamental__nature"];
// echo "觀賞性質：$ornamental__nature<br/>";

$other__demands = $_POST["other__demands"];
$arr__other__demands = implode(",", $other__demands);
// echo "其他需求：$arr__other__demands<br/>";

$Opinion = $_POST["Opinion"];
// echo "意見回饋：$Opinion<br/>";



$dbn = connectDB();
$sql = "INSERT INTO RENTAL_FORM(EVENT_NAME, APPLICANT_UNIT, PRINCIPAL_NAME, UNIT_TYPE, CONTACT_NAME, CONTACT_PHONE, `LOCATION`, `START_DATE`, END_DATE, NATURE_ACT, ORNAMENTAL_ACT, OTHER_DEMANDS, FEEDBACK)
        VALUES(:EVENT_NAME, :APPLICANT_UNIT, :PRINCIPAL_NAME, :UNIT_TYPE, :CONTACT_NAME, :CONTACT_PHONE , :LOCAT,:STARTDATE,:END_DATE,:NATURE_ACT,:ORNAMENTAL_ACT,:OTHER_DEMANDS,:FEEDBACK)";

$statement = $dbn->prepare($sql);

$statement->bindValue(":EVENT_NAME", $activity__name);
$statement->bindValue(":APPLICANT_UNIT", $applicant__unit);
$statement->bindValue(":PRINCIPAL_NAME", $principal__name);
$statement->bindValue(":UNIT_TYPE", $unit__spacing);
$statement->bindValue(":CONTACT_NAME", $Contact__name);
$statement->bindValue(":CONTACT_PHONE", $Contact__phone);
$statement->bindValue(":LOCAT", $place__spacing);
$statement->bindValue(":STARTDATE", $date_pick__from);
$statement->bindValue(":END_DATE", $date_pick__to);
$statement->bindValue(":NATURE_ACT", $arr__nature__activity);
$statement->bindValue(":ORNAMENTAL_ACT", $ornamental__nature);
$statement->bindValue(":OTHER_DEMANDS", $arr__other__demands);
$statement->bindValue(":FEEDBACK", $Opinion);

$statement->execute();

?>