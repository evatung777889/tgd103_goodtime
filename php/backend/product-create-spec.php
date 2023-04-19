<!-- <?php
include("../connect.php");

$_POST = json_decode(file_get_contents('php://input'), true);

$size1 = $_POST["size1"];
$id = $_POST["id"];

$pdo = connectDB();
$sql = "UPDATE PRODUCT_SPEC
SET SPEC = ?
WHERE ID IN (
	SELECT ID FROM (
        SELECT * FROM PRODUCT_SPEC
        where FK_PRODUCT_SPEC_PRODUCT_ID = ?
        LIMIT 0, 1
	) aaa
)";
$statement = $pdo->prepare($sql);
$statement->bindValue(1 , $size1);
$statement->bindValue(2 , $id);
$statement->execute();
$data = $statement->fetchAll();

echo json_encode($data);
?> -->