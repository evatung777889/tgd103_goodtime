<?php
include("../connect.php");

$pid = isset($_GET["pid"]) ? $_GET["pid"] : "";

// $pid = 1;
function getProductInfo($pid, $pdo){
    $sql = "SELECT PRODUCT.*, 
                group_concat(PIC.PATH) as path, 
                group_concat(SPEC.SPEC) as SELECTED, 
                group_concat(SPEC.ID) as SID
            FROM PRODUCT, PRODUCT_PIC PIC, PRODUCT_SPEC SPEC
            WHERE PRODUCT.ID = :pid
                AND PIC.FK_PRODUCT_PIC_PRODUCT_ID = PRODUCT.ID
                AND PRODUCT.ID = SPEC.FK_PRODUCT_SPEC_PRODUCT_ID
                AND PRODUCT.STATUS = 1 
                AND PRODUCT.HIDE = 1;";


    $statement = $pdo->prepare($sql); 
    $statement->bindValue(":pid", $pid);
    $statement->execute();
    $data = $statement->fetchAll();
    echo json_encode($data);
}

getProductInfo($pid, connectDB()); 
?>