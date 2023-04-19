<?php
    include("../verify.php");
    include("../connect.php");

    $mid = isMemberLogin();
    // $mid = "5";

    $sql = "SELECT * 
            FROM MEMBER M, ADDRESS A 
            WHERE M.ID = :mid 
            AND M.ID = A.FK_ADDRESS_MEMBER_ID
            LIMIT 1";
    
    $statement = connectDB()->prepare($sql);
    $statement->bindValue(":mid", $mid);
    $statement->execute();
    $info = $statement->fetchAll();

    print_r(json_encode($info));
?>