<?php

    if (move_uploaded_file($_FILES["file"]["tmp_name"], "../../".$ddd."/img/product_detail/".$_FILES['file']['name'])) {

        echo "done";
        $ddd = "ggg"
        exit;

    }

    echo "failed";

?>