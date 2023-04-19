<?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

// print_r($_POST);
$array = $_POST;
$num = 0;
foreach($array as $k => $itm){
// print_r($k);
// print_r($itm);
if($num <=10){

    $pdo = connectDB();
    $sql = "SELECT * FROM PRODUCT where ID = ?";
    $statement = $pdo->prepare($sql);
    $statement->bindValue(1 , $itm);
    $statement->execute();
    $data[$k] = $statement->fetchAll();
}
$num+=1;
};
// $no1 = $_POST["no1"];
// $no2 = $_POST["no2"];
// $no1 = $_POST["no3"];
// $no1 = $_POST["no4"];
// $no1 = $_POST["no5"];
// $no1 = $_POST["no6"];
// $no1 = $_POST["no7"];
// $no1 = $_POST["no8"];
// $no1 = $_POST["no9"];
// $no1 = $_POST["no10"];

// $pdo = connectDB();
// $sql = "SELECT * FROM PRODUCT where ID = ?";
// $statement = $pdo->prepare($sql);
// $statement->bindValue(1 , $no1);
// $statement->execute();
// $data = $statement->fetchAll();

// $pdo = connectDB();
// $sql = "SELECT * FROM PRODUCT where ID = ?";
// $statement = $pdo->prepare($sql);
// $statement->bindValue(1 , $no2);
// $statement->execute();
// $data = $statement->fetchAll();

// $pdo = connectDB();
// $sql = "SELECT * FROM PRODUCT where ID = ?";
// $statement = $pdo->prepare($sql);
// $statement->bindValue(1 , $no3);
// $statement->execute();
// $data = $statement->fetchAll();

// // $pdo = connectDB();
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $statement = $pdo->prepare($sql);
// // $statement->bindValue(1 , $no4);
// // $statement->execute();
// // $data = $statement->fetchAll();

// // $pdo = connectDB();
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $statement = $pdo->prepare($sql);
// // $statement->bindValue(1 , $no5);
// // $statement->execute();
// // $data = $statement->fetchAll();

// // $pdo = connectDB();
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $statement = $pdo->prepare($sql);
// // $statement->bindValue(1 , $no6);
// // $statement->execute();
// // $data = $statement->fetchAll();

// // $pdo = connectDB();
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $statement = $pdo->prepare($sql);
// // $statement->bindValue(1 , $no7);
// // $statement->execute();
// // $data = $statement->fetchAll();

// // $pdo = connectDB();
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $statement = $pdo->prepare($sql);
// // $statement->bindValue(1 , $no8);
// // $statement->execute();
// // $data = $statement->fetchAll();

// // $pdo = connectDB();
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $statement = $pdo->prepare($sql);
// // $statement->bindValue(1 , $no9);
// // $statement->execute();
// // $data = $statement->fetchAll();

// // $pdo = connectDB();
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $statement = $pdo->prepare($sql);
// // $statement->bindValue(1 , $no10);
// // $statement->execute();
// // $data = $statement->fetchAll();

// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $sql = "SELECT * FROM PRODUCT where ID = ?";
// // $statement = $pdo->prepare($sql);
// // $statement->bindValue(1 , $no1);
// // $statement->bindValue(2 , $no2);
// // $statement->bindValue(3 , $no3);
// // $statement->bindValue(4 , $no4);
// // $statement->bindValue(5 , $no5);
// // $statement->bindValue(6 , $no6);
// // $statement->bindValue(7 , $no7);
// // $statement->bindValue(8 , $no8);
// // $statement->bindValue(9 , $no9);
// // $statement->bindValue(10 , $no10);
// // $statement->execute();
// // $data = $statement->fetchAll();

echo json_encode($data);
?>