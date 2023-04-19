<?php
    include("../connect.php");
    include("../verify.php");

    $mid = isMemberLogin();
    // $mid = "5"; // 會員編號先寫死去測

    $sql = "SELECT CART.*, PRODUCT.*, S.SPEC 
            FROM CART, PRODUCT, PRODUCT_SPEC S 
            WHERE CART.FK_CART_PRODUCT_ID = PRODUCT.ID 
            AND CART.FK_CART_PRODUCT_SPEC_ID = S.ID 
            AND FK_CART_MEMBER_ID = :mid";

    $statement = connectDB()->prepare($sql); 
    $statement->bindValue(":mid", $mid);
    // $statement->bindValue(":mid", getMemberID());
    $statement->execute();
    $data = $statement->fetchAll();

    echo json_encode($data);
?>