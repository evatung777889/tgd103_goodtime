<?php
include("../connect.php");


$_POST = json_decode(file_get_contents('php://input'), true);
// print_r($_POST);

$productname = $_POST["productname"];
$productid = $_POST["productid"];
$productpage = $_POST["productpage"];
$hide = $_POST["hide"];
$status = $_POST["status"];
$kind = $_POST["kind"];
$start = $_POST["start"];
$end = $_POST["end"];

// echo $start;
// echo $end;


$pdo = connectDB();
$sql = "SELECT * FROM b_product where ID like ? and PRODUCT_NAME Like ? and FK_PRODUCT_PAGE_ID LIKE ? and HIDE LIKE ? and `STATUS` LIKE ? and PRODUCT_TYPE_NAME LIKE ? and `START` BETWEEN STR_TO_DATE(?, '%Y-%m-%d')AND STR_TO_DATE(?, '%Y-%m-%d') and `END` BETWEEN STR_TO_DATE(?, '%Y-%m-%d') AND STR_TO_DATE(?, '%Y-%m-%d') order by ID";
$statement = $pdo->prepare($sql);
$statement->bindValue(1 , '%'.$productid.'%');
$statement->bindValue(2 , '%'.$productname.'%');
$statement->bindValue(3 , '%'.$productpage.'%');
$statement->bindValue(4 , $hide);
$statement->bindValue(5 , $status);
$statement->bindValue(6 , '%'.$kind.'%');
$statement->bindValue(7 , $start);
$statement->bindValue(8 , $end);
$statement->bindValue(9 , $start);
$statement->bindValue(10 , $end);

// $statement->bindValue(7 , '2021-12-12');
// $statement->bindValue(8 , "2045-12-12");
// $statement->bindValue(9 , "2021-12-12");
// $statement->bindValue(10 , "2045-12-12");

$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
// echo $productname;
// echo $productid;
// echo $productpage;
// echo $hide;
// echo $status;
// echo $kind;
// echo $start;
// echo $end;

?>