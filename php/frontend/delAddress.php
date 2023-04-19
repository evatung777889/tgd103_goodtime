<?php

    function delAddress($mid, $selectID){
        $pdo = connectDB();

        $sql = "DELETE FROM ADDRESS WHERE FK_ADDRESS_MEMBER_ID = :mid AND ID = :selectID";

        $statement = connectDB()->prepare($sql);
        $statement->bindValue(":mid", $mid);
        $statement->bindValue(":selectID", $selectID);
        $statement->execute();
        
    }
?>