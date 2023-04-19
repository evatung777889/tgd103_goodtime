<?php

define("DB_HOST", "127.0.0.1");
define("DB_USERNAME", "tibamefe_since2021");
define("DB_PASSWORD", "vwRBSb.j&K#E"); 
define("DB_NAME", "tibamefe_tgd103g3");
define("DB_LINK", "mysql:host=".DB_HOST.";dbname=".DB_NAME.";charset=utf8");

function connectDB(){

    $pdo = new PDO(DB_LINK, DB_USERNAME, DB_PASSWORD);

    return $pdo;

}
// $pdo = connectDB();
// $sql = "select * from MEMBER";
// $statement = $pdo->prepare($sql);
// $statement->execute();
// $data = $statement->fetchAll();

// echo json_encode($data);
?>