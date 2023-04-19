<?php

    include("../connect.php");
    include("../verify.php");

    //news
    $pdo = connectDB();
    $sql = "SELECT TITLE, DATE(EDIT_DATE) as EDIT_DATE, `DESC`, ID
            FROM GOODTIME.f_index_2
            -- 依照EDIT_DATE升冪排列
            where `STATUS` = 1
            order by EDIT_DATE desc ";
    $statement = $pdo->prepare($sql);
    $statement->execute();
    $data = $statement->fetchAll();

    echo json_encode($data);
?>