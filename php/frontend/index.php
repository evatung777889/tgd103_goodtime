<?php

    include("../connect.php");
    include("../verify.php");
    
    //輪播
    $pdo = connectDB();
    $sql = "SELECT CONTENT, MAIN_PHOTO,ID
            FROM f_expo_inner
            -- where `STATUS` = 1
            order by END_DATE desc 
            limit 0, 5";
    $statement = $pdo->prepare($sql);
    $statement->execute();
    $data["slider"] = $statement->fetchAll();
    
    //news 渲染
    $pdo = connectDB();
    $sql = "SELECT TITLE, DATE(EDIT_DATE) as EDIT_DATE, `DESC`, ID
            FROM f_index_2
            -- 依照EDIT_DATE升冪排列
            where `STATUS` = 1
            order by EDIT_DATE desc 
            limit 0, 4";
    $statement = $pdo->prepare($sql);
    $statement->execute();
    $data["news"] = $statement->fetchAll();

    //日曆
    $pdo = connectDB();
    $sql = "SELECT TITLE, `START_DATE`, END_DATE
            FROM f_index_1
            where `STATUS` = 1";
    $statement = $pdo->prepare($sql);
    $test = $statement->execute();
    $test = $statement->fetchAll();
    $data["calendar"] = array();
    foreach ($test as $item) {
        $event['title'] = $item['TITLE'];
        $event['start'] = $item['START_DATE'];
        $event['end'] = $item['END_DATE'];
        array_push($data['calendar'], $event);
    }
    
    echo json_encode($data);
?>