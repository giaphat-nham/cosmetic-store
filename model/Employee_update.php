<?php

     if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        $conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
        if (!$conn){
            die("connection fail: ".mysqli_connect_error());
        }

        $employee_id = $_POST["employee_id"];
        $name = $_POST["name"];
        $address = $_POST["address"];
        $email = $_POST["email"];
        $phone = $_POST["phone"];

        if ($email !="") {
            if(!(filter_var($email, FILTER_VALIDATE_EMAIL))) {
                header("location:../admin.php?fname=employee&feature=9&update=".$employee_id."&error=email");
                exit();
                } else {
                $sql2 = "UPDATE staff SET email = '$email' where staff_id= '$employee_id' ";
                if (!mysqli_query($conn, $sql2)) {
                    header("location:../admin.php?fname=employee&feature=9&update=".$employee_id."&error=update");
                    exit();
                
                    }
                }
            }
        
            if ($phone !=""){
            $checkphone = preg_match("/(84|0[0-9]{1})+([0-9]{8,9})\b/",$phone);
            if(!$checkphone) {
                header("location:../admin.php?fname=employee&feature=9&update=".$employee_id."&error=phone");
                exit();
            } else {
                $sql2 = "UPDATE staff SET phone = '$phone' where staff_id= '$employee_id' ";
                if (!mysqli_query($conn, $sql2)){
                    header("location:../admin.php?fname=employee&feature=9&update=".$employee_id."&error=update");
                    exit();
                    }
                }
            }

            if ($name !=""){
                    $sql2 = "UPDATE staff SET staff_name = '$name' where staff_id= '$employee_id' ";
                    if (!mysqli_query($conn, $sql2)){
                        header("location:../admin.php?fname=employee&feature=9&update=".$employee_id."&error=update");
                        exit();
                    
                }
            }

            if ($address !=""){
                $sql2 = "UPDATE staff SET address = '$address' where staff_id= '$employee_id' ";
                if (!mysqli_query($conn, $sql2)){
                    header("location:../admin.php?fname=employee&feature=9&update=".$employee_id."&error=update");
                    exit();
                
            }
        }
        header("location:../admin.php?fname=employee&feature=9&update=".$employee_id."&error=none");


    }
     else {
        header('location:./index.php');
        exit();
    }