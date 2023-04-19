<?php

include("../connect.php");
include("../verify.php");

$mid = isMemberLogin();

$array = $_POST;

$first_key = key($array);

$key = json_decode($first_key, true);
// print_r($key);



function calcAmt($dbn, $mid, $eid, $price){
    $amt = 0;

    $sql = "SELECT EXPO_PRICE 
            FROM TICKET
            WHERE MEMBER_ID = :mid 
            AND EXPO_ID = :eid 
            AND EXPO_PRICE = :price";
    
    $statement = $dbn->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":eid", $eid);
    $statement->bindValue(":price", $price);
    $statement->execute();
    $charge = $statement->fetchAll();
    // print_r($charge);
    $amt = $charge[0]["EXPO_PRICE"];
    return $amt;
}

$dbn = connectDB(); 
$dbn->beginTransaction();
$amt = 0;
foreach($key as $eid => $priceArray){
    // print_r($eid);
    // foreach($priceArray as $price){
        // print_r($price);
        // print_r("<br>");
        // $amt += calcAmt($dbn, $mid, $eid, $price);
        $amt += calcAmt($dbn, $mid, $eid, $priceArray["price"]) * $priceArray["qty"];
        // checkout($dbn, $mid, $eid, $price);
        // checkout($dbn, 5, $eid, $price);
    // }
    
};

$dbn->commit();

print_r($amt);



?>
