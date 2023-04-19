<?php

function editAddress($newAddress, $mid, $selectID){
    $pdo = connectDB();

    $sql = "UPDATE ADDRESS 
            SET LOCATION = :newAddress
            WHERE FK_ADDRESS_MEMBER_ID = :mid
            AND ID = :selectID";

    $statement = $pdo->prepare($sql);
    $statement->bindValue(":newAddress", $newAddress);
    $statement->bindValue(":mid", $mid);
    $statement->bindValue(":selectID", $selectID);
    $statement->execute();
    // $data["res"] = "地址修改完成";
    // echo $data;
}

?>