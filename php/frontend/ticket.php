<?php

include("../connect.php");
include("../verify.php");

    $mid = isMemberLogin();
//     $mid = "5";

$sql = "SELECT TICKET.*, EXPO.* 
        FROM TICKET, EXPO 
        WHERE TICKET.EXPO_ID = EXPO.ID 
        AND TICKET.MEMBER_ID = :mid";

$statement = connectDB()->prepare($sql);
$statement->bindValue(":mid", $mid);
// $statement->bindValue(":mid", getMemberID());
$statement->execute();
$data = $statement->fetchAll();

print_r(json_encode($data));
?>