<?php

include("../connect.php");
include("../verify.php");

$mid = isMemberLogin();

$array = $_POST;

$first_key = key($array);

$key = json_decode($first_key, true);
// print_r($key);

function calcAmt($dbn, $mid, $pid, $sid){
    $amt = 0;

    $sql = "SELECT PRICE 
            FROM PRODUCT, CART 
            WHERE PRODUCT.ID = CART.FK_CART_PRODUCT_ID
            AND CART.FK_CART_MEMBER_ID = :mid 
            AND CART.FK_CART_PRODUCT_ID = :pid 
            AND CART.FK_CART_PRODUCT_SPEC_ID = :sid";
    
    $statement = $dbn->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->bindValue(":sid", $sid);
    $statement->execute();
    $charge = $statement->fetchAll();
    // print_r($charge);
    $amt = $charge[0]["PRICE"];
    return $amt;
}

$dbn = connectDB(); 
$dbn->beginTransaction();
$amt = 0;
foreach($key as $pid => $sidArray){
    // print_r($pid);
    //     print_r("<br>");
    // foreach($sidArray as $sid => $qty){
        // print_r($sidArray["sid"]);
        // print_r($sidArray["qty"]);
        // print_r(calcAmt($dbn, 5, 1, 5));
        // $amt += calcAmt($dbn, $mid, $pid, $sid);
        $amt += calcAmt($dbn, $mid, $pid, $sidArray["sid"]) * $sidArray["qty"];
        // checkout($dbn, $mid, $pid, $sid);
        // checkout($dbn, 5, $pid, $sid);
    // }
    
};

$dbn->commit();

print_r($amt);

?>