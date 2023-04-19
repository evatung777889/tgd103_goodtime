<?php

include("../connect.php");
include("../verify.php");

$MEMBER = json_decode(file_get_contents("php://input"), true);


if ($MEMBER["user_pwd"] != "") {
    $sql = "UPDATE MEMBER SET PASSWORD =:user_pwd
            WHERE EMAIL = :email";

    $statement = connectDB()->prepare($sql);
    $statement->bindValue(":email", $MEMBER["user_email"]);
    $statement->bindValue(":user_pwd", $MEMBER["user_pwd"]);



} else {
    $sql = "SELECT EMAIL
            FROM MEMBER 
            WHERE EMAIL = :email";

    $statement = connectDB()->prepare($sql);
    $statement->bindValue(":email", $MEMBER["user_email"]);


}

$statement->execute();
$news = $statement->fetchAll();
echo json_encode($news);


?>