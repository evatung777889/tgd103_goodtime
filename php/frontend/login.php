<?php

    include("../connect.php");
    include("../verify.php");

    $member = json_decode(file_get_contents("php://input"), true);

    $email = $member["user_email"];
    $pwd = $member["user_password"];
    // $email = "member2@goodtime.com";
    // $pwd = "member2";
    $sql = "SELECT * FROM MEMBER WHERE VERIFY = 1 AND EMAIL = :email AND `PASSWORD` = :pwd";

    $statement = connectDB()->prepare($sql);
    $statement->bindValue(":email", $email);
    $statement->bindValue(":pwd", $pwd);
    $statement->execute();
    $data = $statement->fetchAll();

    $memberID = "";
    $username = "";
    foreach($data as $index => $row){
        $memberID = $row["ID"];
        $username = $row["USERNAME"];
    }
    // 判斷是否有註冊
    if($memberID != "" && $username != ""){
        // 寫入session供之後頁面使用
        setMemberSession($memberID, $username);
        echo "登入成功";
    }else{
        echo "電子郵箱或密碼錯誤";
    }
?>