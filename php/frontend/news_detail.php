<?php

include("../connect.php");

//news get ID
    $_POST = json_decode(file_get_contents('php://input'), true);

    $id = $_POST["id"];

    $pdo = connectDB();
    $sql = "SELECT ID, TITLE, CONTENT, 
            MAIN_PHOTO, 
            DATE(CREATE_DATE) as CREATE_DATE, 
            `DESC`
            FROM GOODTIME.f_news_inner 
            where ID = ?";
    $statement = $pdo->prepare($sql);
    $statement ->bindValue(1 , $id);
    $statement->execute();
    $data = $statement->fetchAll();
    // $data["GETID"] = $statement->fetchAll();


//get MAX ID
    // $pdo = connectDB();
    // $sql = "SELECT max(ID) FROM GOODTIME.f_news_inner";
    // $statement = $pdo->prepare($sql);
    // $statement ->bindValue(1 , $id);
    // $statement->execute();
    // $data = $statement->fetchAll();




    echo json_encode($data);
?>