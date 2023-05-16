<?php
     if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        $conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
        if (!$conn){
            die("connection fail: ".mysqli_connect_error());
        }

        $customer_id = $_POST["customer_id"];
        $name = $_POST["name"];
        $address = $_POST["address"];
        $email = $_POST["email"];
        $phone = $_POST["phone"];

        if ($email !="") {
            if(!(filter_var($email, FILTER_VALIDATE_EMAIL))) {
                header("location:../admin.php?fname=customer&feature=8&update=".$customer_id."&error=email");
                exit();
                } else {
                $sql2 = "UPDATE customer SET email = '$email' where cusotmer_id= '$customer_id' ";
                if (!mysqli_query($conn, $sql2)) {
                    header("location:../admin.php?fname=customer&feature=8&update=".$customer_id."&error=update");
                    exit();
                
                    }
                }
            }
        
            if ($phone !=""){
            $checkphone = preg_match("/(84|0[0-9]{1})+([0-9]{8,9})\b/",$phone);
            if(!$checkphone) {
                header("location:../admin.php?fname=customer&feature=8&update=".$customer_id."&error=phone");
                exit();
            } else {
                $sql2 = "UPDATE customer SET phone = '$phone' where cusotmer_id= '$customer_id' ";
                if (!mysqli_query($conn, $sql2)){
                    header("location:../admin.php?fname=customer&feature=8&update=".$customer_id."&error=update");
                    exit();
                    }
                }
            }

            if ($name !=""){
                    $sql2 = "UPDATE customer SET name = '$name' where cusotmer_id= '$customer_id' ";
                    if (!mysqli_query($conn, $sql2)){
                        header("location:../admin.php?fname=customer&feature=8&update=".$customer_id."&error=update");
                        exit();
                    
                }
            }

            if ($address !=""){
                $sql2 = "UPDATE customer SET address = '$address' where cusotmer_id= '$customer_id' ";
                if (!mysqli_query($conn, $sql2)){
                    header("location:../admin.php?fname=customer&feature=8&update=".$customer_id."&error=update");
                    exit();
                
            }
        }
        header("location:../admin.php?fname=customer&feature=8&update=".$customer_id."&error=none");
    }
    else {
       header('location:./index.php');
       exit();
   }