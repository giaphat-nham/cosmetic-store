<?php

     if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        $conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
        if (!$conn){
            die("connection fail: ".mysqli_connect_error());
        }

        
        $account_id = (int) $_POST["account_id"];
        $username = $_POST["username"];
        $newPass = $_POST["newPass"];
        $newPassConfir = $_POST["newPassConfir"];
        $account_type = $_POST["account_type"];
        $passHash ="";

        print_r($_POST);

            $sql = "SELECT account_id,username,password,decent_id from account where account_id = $account_id ";
            $result = mysqli_query($conn, $sql);
            $row = mysqli_fetch_array($result);
            
            if($newPass !=""){
            if ($newPass != "" && $newPassConfir != "")
                {
                   
                        if($newPass == $newPassConfir){
                            $passHash = password_hash($newPass,PASSWORD_DEFAULT);
                        } else {
                            header("location:../admin.php?fname=account&feature=1&update=".$row['account_id']."&error=confirm");
                            exit();
                        }
                }
                else {
                    header("location:../admin.php?fname=account&feature=1&update=".$row['account_id']."&error=empty");
                    exit();
                }
            } 
            
            if ($passHash !=""){
                $sql1 = "UPDATE account SET password = '$passHash'  where account_id = $account_id ";
                if (!mysqli_query($conn, $sql1)){
                    header("location:../admin.php?fname=account&feature=1&update=".$row['account_id']."&error=update");
                    exit();
                } 
            }

            if ($account_type != $row['decent_id'])

            {
                $sql1 = "UPDATE account SET decent_id = '$account_type' where account_id = $account_id ";
                mysqli_query($conn, $sql1);

                if ($account_type == 1 && $row['decent_id'] != 1 ){


                    $sql2 = "SELECT account_id,staff_name,email,phone,address from staff where account_id = $account_id ";
                    $result1 = mysqli_query($conn, $sql2);
                    $value = mysqli_fetch_array($result1);

            
                    $sql3  ="INSERT INTO customer (account_id,name,email,phone,address) VALUE(?,?,?,?,?);";
                    $stmt3 = mysqli_stmt_init($conn);
                    mysqli_stmt_prepare($stmt3, $sql3);
                    mysqli_stmt_bind_param($stmt3,'issis', $account_id , $value['staff_name'],$value['email'],$value['phone'],$value['address']);
                    mysqli_stmt_execute($stmt3);
                    mysqli_stmt_close($stmt3);

                    $sql4 = "DELETE FROM customer WHERE account_id =$account_id;";
                    mysqli_query($conn, $sql4);
                }
                else if (($account_type ==2 || $account_type ==3 )&& $row['decent_id'] ==1 ){
                    $sql2 = "SELECT account_id,name,email,phone,address from customer where account_id = $account_id ";
                    $result1 = mysqli_query($conn, $sql2);

                    $value = mysqli_fetch_array($result1);

            
                    $sql3  ="INSERT INTO staff (account_id,staff_name,email,phone,address) VALUE(?,?,?,?,?);";
                    $stmt3 = mysqli_stmt_init($conn);
                    mysqli_stmt_prepare($stmt3, $sql3);
                    mysqli_stmt_bind_param($stmt3,'issis',$account_id,$value['name'],$value['email'],$value['phone'],$value['address']);
                    mysqli_stmt_execute($stmt3);
                    mysqli_stmt_close($stmt3);

                    $sql4 = "DELETE FROM staff WHERE account_id =$account_id;";
                    mysqli_query($conn, $sql4);
                }
            }
            
            header("location:../admin.php?fname=account&feature=1&update=".$row['account_id']."&error=none");
        }
            else {
                header('location:./index.php');
                exit();
            }