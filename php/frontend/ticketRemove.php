<?php
    include("../connect.php");
    include("../verify.php");

    // $mid = $_POST["mid"];
    $mid = isMemberLogin();
    // $mid = 5; 
    $eid = $_POST["eid"];
    $price = $_POST["price"];

    $sql = "DELETE FROM TICKET WHERE MEMBER_ID = :mid AND EXPO_ID = :eid AND EXPO_PRICE = :price";

    $statement = connectDB()->prepare($sql);
    $statement->bindValue(":mid", $mid);
    // $statement->bindValue(":mid", getMemberID());
    $statement->bindValue(":eid", $eid);
    $statement->bindValue(":price", $price);
    $statement->execute(); 
    $data = $statement;

    echo True;

?>