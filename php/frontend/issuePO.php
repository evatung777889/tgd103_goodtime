<?php

    include("../connect.php");
    include("../verify.php");
    if(!isset($_SESSION)){
        session_start();
    }
    // print_r($_SESSION);
    $mid = isMemberLogin();
    $itm = json_decode($_SESSION["itm"], true);
    $tkt = json_decode($_SESSION["tkt"], true);
    $amt = json_decode($_SESSION["amt"], true);
    // print_r($tkt);
    function checkoutCart($dbn, $mid, $pid, $sid){

        $sql = "DELETE FROM CART 
                WHERE FK_CART_MEMBER_ID = :mid 
                AND FK_CART_PRODUCT_ID = :pid 
                AND FK_CART_PRODUCT_SPEC_ID = :sid";
        
        $statement = $dbn->prepare($sql);
        $statement->bindValue(":mid", $mid);
        $statement->bindValue(":pid", $pid);
        $statement->bindValue(":sid", $sid);
        $statement->execute();
    }

    function checkoutTkt($dbn, $mid, $eid, $price){

        $sql = "DELETE FROM TICKET 
                WHERE MEMBER_ID = :mid 
                AND EXPO_ID = :eid 
                AND EXPO_PRICE = :price";
        
        $statement = $dbn->prepare($sql);
        $statement->bindValue(":mid", $mid);
        $statement->bindValue(":eid", $eid);
        $statement->bindValue(":price", $price);
        $statement->execute();
    }

    function insertPOD($pdo, $id, $price, $qty, $oid, $sid){
        $sql = "INSERT INTO PO_DETAIL(FK_PO_DETAIL_PRODUCT_ID, UNIT_PRICE, QTY, FK_PO_DETAIL_PO_ID, FK_PO_PRODUCT_SPEC_ID)
                values(:id, :price, :qty, :oid, :sid)";
    
        $statement = $pdo->prepare($sql);
        $statement->bindValue(":id", $id);
        $statement->bindValue(":price", $price);
        $statement->bindValue(":qty", $qty);
        $statement->bindValue(":oid", $oid);
        $statement->bindValue(":sid", $sid);
        $statement->execute();
    }

    $dbn = connectDB(); 
    $dbn->beginTransaction();
    foreach($itm as $pid => $array){
        checkoutCart($dbn, $mid, $pid, $array["sid"]);
    };
    foreach($tkt as $eid => $array){
        checkoutTkt($dbn, $mid, $eid, $array["price"]);
    };
    $sql = "INSERT INTO PO(FREIGHT, ETD, STATUS, STATUS_DATE, CREATE_DATE, FK_PO_MEMBER_ID)
            values(60, NOW() + INTERVAL 5 DAY, 1, NOW(), NOW(), :mid)";
    $statement = $dbn->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->execute();

    $oid = $dbn->lastInsertId();
    $oid = intval($oid);
    // print_r($oid);
    foreach($itm as $pid => $array){
        $sql = "SELECT PRICE from PRODUCT WHERE ID = :pid";
        $statement = $dbn->prepare($sql);
        $statement->bindValue(":pid", $pid);
        $statement->execute();
        $priceArr = $statement->fetchAll();
        $price = $priceArr[0]["PRICE"];
        // print_r($price);
        insertPOD($dbn, $pid, $price, $array["qty"], $oid, $array["sid"]);
    };
    foreach($tkt as $eid => $array){
        insertPOD($dbn, $eid, $array["price"], $array["qty"], $oid, null);
    };

    $dbn->commit();

    $sql = "SELECT * FROM PO WHERE ID = :oid";
    $statement = $dbn->prepare($sql);
    $statement->bindValue(":oid", $oid);
    $statement->execute();
    $dataList = $statement->fetchAll();

    print_r(json_encode($dataList));
?>