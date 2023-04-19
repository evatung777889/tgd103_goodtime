<?php

include("../connect.php");
include("../verify.php");

$eid = $_POST["eid"]; 
$buyQty = $_POST["buyQty"];
$price = $_POST["price"];
// $eid = 1;
// $buyQty = 1; 
// $price = 300;
    $mid = isMemberLogin();
    // $mid = "5"; // 會員編號先寫死去測
// print_r($_POST);
function getTicket($pdo, $mid, $eid, $price){

    $sql = "SELECT * 
            FROM TICKET
            WHERE MEMBER_ID = :mid 
            AND EXPO_ID = :eid
            AND EXPO_PRICE = :price";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":eid", $eid);
    $statement->bindValue(":price", $price);
    $statement->execute();
    $data = $statement->fetchAll();

    return $data;
}

function updateTicket($pdo, $newQty, $ticketEid, $mid, $price){
    $sql = "UPDATE TICKET 
            SET QTY = :newQty, TICKET_DATE = now() 
            WHERE EXPO_ID = :ticketEid 
            AND MEMBER_ID = :mid 
            AND EXPO_PRICE = :price";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":newQty", $newQty);
    $statement->bindValue(":ticketEid", $ticketEid);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":price", $price);
    $data = $statement->execute();
    // print_r($data);
}

function insertTicket($pdo, $qty, $mid, $eid, $price){
    $sql = "INSERT INTO TICKET(QTY, TICKET_DATE, MEMBER_ID, EXPO_ID, EXPO_PRICE)
            values(:qty, now(), :mid, :eid, :price)";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":qty", $qty);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":eid", $eid);
    $statement->bindValue(":price", $price);
    $statement->execute();
}

// for dev
// if (!isset(isMemberLogin())){
//     exit(false);
// }

$data = getTicket(connectDB(), $mid, $eid, $price);
// $data = getTicket(connectDB(), getMemberID(), $eid, $price);

if (count($data) > 0){
// print_r($data);
    foreach($data as $index => $row){
        $ticketEid = $row["ID"];
        $previousQty = $row["QTY"];
    }

    $newQty = $buyQty + $previousQty;
    // print_r($ticketEid);
    updateTicket(connectDB(), $newQty, $ticketEid, $mid, $price);
    // updateTicket(connectDB(), $newQty, $ticketEid, getMemberID(), $price);

}else{
    insertTicket(connectDB(), $buyQty, $mid, $eid, $price);
    // insertTicket(connectDB(), $buyQty, getMemberID(), $eid, $price);
}


?>