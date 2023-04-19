<?php
include("../connect.php");
include("../verify.php");

$pid = $_POST["pid"]; 
$buyQty = $_POST["buyQty"];
$spec = $_POST["spec"];
    $mid = isMemberLogin();
// $mid = "5"; // 會員編號先寫死去測
// print_r($_POST);
function getCart($pdo, $mid, $pid, $spec){

    $sql = "SELECT * 
            FROM CART, PRODUCT_SPEC SPEC 
            WHERE FK_CART_MEMBER_ID = :mid 
            AND FK_CART_PRODUCT_ID = :pid
            AND CART.FK_CART_PRODUCT_SPEC_ID = :spec
            AND CART.FK_CART_PRODUCT_ID = SPEC.FK_PRODUCT_SPEC_PRODUCT_ID";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->bindValue(":spec", $spec);
    $statement->execute();
    $data = $statement->fetchAll();

    return $data;
}

function updateCart($pdo, $newQty, $cartPid, $mid, $spec){
    $sql = "UPDATE CART 
            SET QTY = :newQty, CART_DATE = now() 
            WHERE FK_CART_PRODUCT_ID = :cartPid 
            AND FK_CART_MEMBER_ID = :mid 
            AND FK_CART_PRODUCT_SPEC_ID = :spec";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":newQty", $newQty);
    $statement->bindValue(":cartPid", $cartPid);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":spec", $spec);
    $data = $statement->execute();
    // print_r($data);
}

function insertCart($pdo, $qty, $mid, $pid, $spec){
    $sql = "INSERT INTO CART(QTY, CART_DATE, FK_CART_MEMBER_ID, FK_CART_PRODUCT_ID, FK_CART_PRODUCT_SPEC_ID)
            values(:qty, now(), :mid, :pid, :spec)";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":qty", $qty);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":pid", $pid);
    $statement->bindValue(":spec", $spec);
    $statement->execute();
}

// for dev
// if (!isset(isMemberLogin())){
//     exit(false);
// }

$data = getCart(connectDB(), $mid, $pid, $spec);
// $data = getCart(connectDB(), getMemberID(), $pid, $spec);

if (count($data) > 0){
// print_r($data);
    foreach($data as $index => $row){
        $cartPid = $row["ID"];
        $previousQty = $row["QTY"];
    }

    $newQty = $buyQty + $previousQty;
    // print_r($cartPid);
    updateCart(connectDB(), $newQty, $pid, $mid, $spec);
    // updateCart(connectDB(), $newQty, $cartPid, getMemberID(), $spec);

}else{
    insertCart(connectDB(), $buyQty, $mid, $pid, $spec);
    // insertCart(connectDB(), $buyQty, getMemberID(), $pid);
}


?>