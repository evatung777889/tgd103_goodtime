<?php

    if (move_uploaded_file($_FILES["file"]["tmp_name"], "../../src/img/event_detail/".$_FILES['file']['name'])) {

        echo "done";

        exit;

    }

    echo "failed";

?>