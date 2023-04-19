<?php
include("../connect.php");

function getEventList($pdo){
    $sql = "SELECT ID, MAIN_PHOTO, TAG1, TAG2, TITLE, START_DATE, END_DATE
            FROM EXPO
            WHERE NOW() <= END_DATE";


    $statement = $pdo->prepare($sql); 
    $statement->execute();
    $data = $statement->fetchAll();
    print_r(json_encode($data));
}

getEventList(connectDB()); 
?>