<?php

    include("../connect.php");

    $member = json_decode(file_get_contents("php://input"), true);

    $email = $member["user_email"];
    $pwd = $member["user_password"];
    $username = $member["user_name"];
    $phone = $member["user_phone"];
    $address = $member["user_addr"];
    // $email = "member2@goodtime.com";
    // $pwd = "member2";    
    // $username = "member2";
    // $phone = "0987654321";
    // $address = "100台北市中正區濟南路一段321號";

    function getMemberList($email){ // 1. 檢查email重覆
        $sql = "SELECT * from MEMBER WHERE EMAIL = :email";

        $statement = connectDB()->prepare($sql);
        $statement->bindValue(":email", $email);
        $statement->execute();
        $data = $statement->fetchAll();

        return $data;
    }

    function joinMember($email, $pwd, $username, $phone, $address){
        // 2. 會員註冊
        $dbn = connectDB();
        $dbn->beginTransaction();
        $sql = "INSERT INTO MEMBER(EMAIL, `PASSWORD`, USERNAME, PHONE)
                VALUES(:email, :pwd, :username, :phone)";

        $statement = $dbn->prepare($sql);
        $statement->bindValue(":email", $email);
        $statement->bindValue(":pwd", $pwd);
        $statement->bindValue(":username", $username);
        $statement->bindValue(":phone", $phone);
        $statement->execute();
        
        $mid = $dbn ->lastInsertId();
        if(empty($mid)){
            echo "會員註冊失敗";
        }else{
            $sql = "INSERT INTO `ADDRESS`(`LOCATION`, FK_ADDRESS_MEMBER_ID)
                    VALUES(:address, :mid)";
        
            $statement =  $dbn->prepare($sql);
            $statement->bindValue(":address", $address);
            $statement->bindValue(":mid", $mid);
            $statement->execute();
             $dbn ->commit();
            }
    }

    $data = getMemberList($email);

    if(count($data) > 0){
        echo "已有帳號使用此電子郵件地址。請選擇其他電子郵件地址。";
    }else{
        joinMember($email, $pwd, $username, $phone, $address);
        echo "會員註冊成功，請重新登入";
    }
?>