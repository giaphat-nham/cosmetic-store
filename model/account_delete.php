<?php

    if (isset($_GET["act"]) && isset($_GET["user"]) && isset($_GET['place']) ){
        $user = (int) $_GET["user"];
        $conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
        $place = $_GET['place'];
        
        if (!$conn){
        die("connection fail: ".mysqli_connect_error());
        }


        $sql = "SELECT account_id,decent_id from account where account_id = $user ";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($result);

        
        if ($place == "account"){
        if ($_GET["act"] == "delete"){
            if ($row["decent_id"]== 1){
                $sql1 = "DELETE FROM customer WHERE account_id = '$user';";
                $sql2 = "DELETE FROM account WHERE account_id = '$user';";
                mysqli_query($conn, $sql1);
                mysqli_query($conn, $sql2);
                header('location:../admin.php?fname=account&feature=1&del=succcess');
                exit();
            }

            if ($row["decent_id"]== 2 || $row["decent_id"]== 3){
                $sql1 = "DELETE FROM staff WHERE account_id ='$user';";
                $sql2 = "DELETE FROM account WHERE account_id ='$user';";
                mysqli_query($conn, $sql1);
                mysqli_query($conn, $sql2);
                header('location:../admin.php?fname=account&feature=1&del=succcess');
                exit();
            }
        }
    }

    if ($place =="customer"){
            $sql1 = "DELETE FROM customer WHERE account_id = '$user';";
            $sql2 = "DELETE FROM account WHERE account_id = '$user';";
            mysqli_query($conn, $sql1);
            mysqli_query($conn, $sql2);
            header('location:../admin.php?fname=customer&feature=8&del=succcess');
            exit();
        }

    if ($place =="employee"){
        $sql1 = "DELETE FROM staff WHERE account_id ='$user';";
                $sql2 = "DELETE FROM account WHERE account_id ='$user';";
                mysqli_query($conn, $sql1);
                mysqli_query($conn, $sql2);
                header('location:../admin.php?fname=employee&feature=9#&del=succcess');
                exit();
    }

    } else {
        header('location:../index.php');
        exit();
    }