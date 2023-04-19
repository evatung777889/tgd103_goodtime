<?php
    include("../connect.php");

    $eid = isset($_GET["eid"])? $_GET["eid"] : "1";

    function getExpoInfo($eid, $pdo){
        $sql = "SELECT * FROM EXPO WHERE ID = :eid";

        $statement = $pdo->prepare($sql);
        $statement->bindValue(":eid", $eid);
        $statement->execute();
        $data = $statement->fetchAll();
        echo json_encode($data);
    }

    getExpoInfo($eid, connectDB())
?>