<?php   
    if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        $username = $_POST["username"];
        $pwd = $_POST["password"];

        $conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
        if (!$conn){
            die("connection fail: ".mysqli_connect_error());
        }

        if(checkLogin($username, $pwd) !== false) {
            header("Location: ../index.php?loginerror=loginEmpty");
            exit();
        }

        loginUser($conn, $username, $pwd);
    }

    else{
        header('location:../index.php');
        exit();
    }

    function checkLogin($username, $pwd){
        if (empty($username)|| empty($pwd))
        {
            $result = true;
        }
        else
        {
            $result = false;
        }
        return $result;
    }

    function loginUser($conn, $username, $pwd){
        $user_exist = checkUser($conn, $username);

        if ($user_exist === false)
        {
            header("location:../index.php?loginerror=wrongUser");
            exit();
        }
        else{
            $pwdhased = $user_exist['password'];
            // $checkpwd =password_verify($pwd,$pwdhased);
    
            if($pwdhased != $pwd){
                header("location:../index.php?loginerror=wrongPass");
                exit();
            }
            else if ($pwdhased == $pwd) {
                session_start();
                $_SESSION['account_id'] =$user_exist['account_id'];
                $_SESSION['username'] =$user_exist['username'];
                header("location:../index.php");    
                exit();
            }
        }     
    }

    
    
    function checkUser($conn,$username) {

        $sql  = "SELECT * FROM account WHERE username=?;";
        $stmt = mysqli_stmt_init($conn);
        if (!mysqli_stmt_prepare($stmt, $sql)){
            header("location:../index.php?loginerror=loginstmtfailted");
            exit();
        }
    
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