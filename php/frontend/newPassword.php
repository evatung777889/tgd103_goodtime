<?php
    function newPassword($mid, $pwd, $newPwd){
        $pdo = connectDB();

        $sql = "UPDATE MEMBER 
                SET PASSWORD = :newPwd
                WHERE ID = :mid 
                AND PASSWORD = :pwd";

        $statement = $pdo->prepare($sql);
        $statement->bindValue(":mid", $mid);
        $statement->bindValue(":pwd", $pwd);
        $statement->bindValue(":newPwd", $newPwd);
        $statement->execute();
        
    }
?>