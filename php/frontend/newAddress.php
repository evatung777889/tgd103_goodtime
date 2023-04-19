<?php

// $newAddress = $_POST["address"];
// $newAddress = "台北市松山區敦化北路100號2樓"; 

function newAddress($mid, $newAddress){
    $pdo = connectDB();

    function insertSQL($pdo, $sql, $mid, $newAddress){
        // 進出SQL用語法
        $statement = $pdo->prepare($sql);
        $statement->bindValue(":mid", $mid);
        $statement->bindValue(":newAddress", $newAddress);
        $statement->execute();
        return $statement->fetchAll();
    }

    function getAddress($pdo, $mid, $newAddress){
        $sql = "SELECT * from ADDRESS 
        WHERE FK_ADDRESS_MEMBER_ID = :mid 
        AND LOCATION = :newAddress";

        $data = insertSQL($pdo, $sql, $mid, $newAddress);
        return $data;
    }

    $data = getAddress($pdo, $mid, $newAddress);
    
    if (count($data) === 0){
        $sql = "INSERT INTO ADDRESS(FK_ADDRESS_MEMBER_ID, LOCATION)
                VALUES(:mid, :newAddress)";
        
        insertSQL($pdo, $sql, $mid, $newAddress);
        // echo "地址新增成功";
    }else{
        // echo "地址新增錯誤";
    }
}

// newAddress(7, $newAddress);
?>