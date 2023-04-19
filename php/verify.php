<?php

function isMemberLogin(){
    // 取已登入的會員ID
    if(!isset($_SESSION)){
        session_start();
    }
    return isset($_SESSION["memberID"]) ? $_SESSION["memberID"] : "";
}

function setMemberSession($memberID, $username){
    // session是否存在都overwrite最新的會員資訊
    if(!isset($_SESSION)){
        session_start();
    }
        // 寫入session供之後頁面使用
    $_SESSION["memberID"] = $memberID;
    $_SESSION["username"] = $username;
}

?>