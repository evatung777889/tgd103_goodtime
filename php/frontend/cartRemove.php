<?php
    include("../connect.php");
    include("../verify.php");

    $mid = isMemberLogin();
    // $mid = $_POST["mid"];
    // $mid = 5; 
    $pid = $_POST["pid"];
    $sid = $_POST["sid"];

    $sql = "DELETE FROM CART WHERE FK_CART_MEMBER_ID = :mid AND FK_CART_PRODUCT_ID = :pid AND FK_CART_PRODUCT_SPEC_ID = :sid";

    $statement = connectDB()->prepare($sql);
    $statement->bindValue(":mid", $mid);
    // $statement->bindValue(":mid", getMemberID());
    $statement->bindValue(":pid", $pid);
    $statement->bindValue(":sid", $sid);
    $statement->execute(); 
    $data = $statement;

    echo True;

?>