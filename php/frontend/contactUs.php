<?php

include("../connect.php");
include("../verify.php");

$_POST = json_decode(file_get_contents("php://input"), true);

$name = $_POST["name"];
$phone = $_POST["phone"];
$email = $_POST["email"];
$Opinion = $_POST["Opinion"];

$dbn = connectDB();
$sql = "INSERT INTO CONTACT_US(`NAME`,PHONE,EMAIL, FEEDBACK)
        VALUES(:CONTACTname, :PHONE, :EMAIL,:FEEDBACK)";

$statement = $dbn->prepare($sql);

$statement->bindValue(":CONTACTname", $name);
$statement->bindValue(":PHONE", $phone);
$statement->bindValue(":EMAIL", $email);
$statement->bindValue(":FEEDBACK", $Opinion);

$statement->execute();

?>