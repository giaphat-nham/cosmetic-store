<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST'){

    $response = array(
        "status" => 0,
        "message" => "form failed"
    );
    
    session_start();


    $conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
    if (!$conn){
        die("connection fail: ".mysqli_connect_error());
    }

    if (isset($_POST['username']) || isset($_POST['password'])){


        $username = $_POST['username'];
        $password = $_POST['password'];
            if (empty($username) || empty($password)){
                $response['message'] = " xin vui lòng nhập đầy đủ thông tin đăng nhập!!! ";
            }
            else{
                $user_exist = checkUser($conn, $username);
                if ($user_exist === false){
                    $response['message'] = "Tên đăng nhập không chính xác!!!";
                    $userError = true;
                } else {
                    $sqlpwd = $user_exist['password'];

                    
                    if ($password != $sqlpwd){
                            $response['message'] = "Mật khẩu không chính xác!!!";
                            $pwdError = true; 
                        } else {
                        $_SESSION['account_id'] =$user_exist['account_id'];
                        $_SESSION['username'] =$user_exist['username'];
                        if ($user_exist['decent_id'] == 1){
                            $response['message'] = "<script>window.location='index.php'</script>";
                        }
                        else if ($user_exist['decent_id'] ==2 || $user_exist['decent_id'] == 3 || $user_exist['decent_id'] == 4){
                            $response['message'] = "<script>window.location='admin.php'</script>";
                        }
                    }
                }
            }
    }


echo json_encode($response);

} 
else {
    header('location:../index.php');
    exit();
}


function checkUser($conn,$username){

    $sql  = "SELECT username,account_id,password,decent_id FROM account WHERE username=?;";
    $stmt = mysqli_stmt_init($conn);

    mysqli_stmt_prepare($stmt, $sql);


    mysqli_stmt_bind_param($stmt,"s",$username);
    mysqli_stmt_execute($stmt);

    $resultData =  mysqli_stmt_get_result($stmt);

    if ($row = mysqli_fetch_assoc($resultData)){
        mysqli_stmt_close($stmt);
        return $row;
    }
    else{
        $result = false;
        mysqli_stmt_close($stmt);
        return $result;
    }
}
