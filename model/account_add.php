<?php   
    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $name = $_POST["name"];
        $username = $_POST["username"];
        $pwd = $_POST["password"];
        $pwdConfirm = $_POST["passwordConfirm"];
        $email = $_POST["email"];
        $phone = $_POST["phone"];
        $account_type = $_POST["account_type"];

    $conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
     if (!$conn){
        die("connection fail: ".mysqli_connect_error());
     }

    if(checkSignup($username,$pwd,$pwdConfirm) !== false) {
        header("location:../admin.php?fname=account&feature=1&add=0&errorAdd=empty");
        exit();
    }
    
    
    if(checkUser($conn,$username) !== false) {
        header("location:../admin.php?fname=account&feature=1&add=0&errorAdd=user");
        exit();
    }
    
    
    if (checkpwd($pwd,$pwdConfirm) !== false) {
        header("location:../admin.php?fname=account&feature=1&add=0&errorAdd=password");
        exit();
    }

     //check email
    //$checkEmail = preg_match("/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/" ,$email);
    if(!(filter_var($email, FILTER_VALIDATE_EMAIL))){
        header("location:../admin.php?fname=account&feature=1&add=0&errorAdd=notEmail");
        exit();
    }

    //check sdt
    $checkphone = preg_match("/(84|0[0-9]{1})+([0-9]{8,9})\b/",$phone);
    if(!$checkphone) {
        header("location:../admin.php?fname=account&feature=1&add=0&errorAdd=notPhone");
        exit();
    }

    createUser($conn,$name,$username,$pwd,$email,$phone,$account_type);
    }


    else
    {
      header('location:../index.php');
      exit();
    }

    



//check co du lieu nao trong khong
function checkSignup($username,$pwd,$pwdConfirm) {
    if (empty($username)|| empty($pwd)|| empty($pwdConfirm))
    {
        $result = true;
    }
    else
    {
        $result = false;
    }
    return $result;
}
//kiem tra 2 password co giong nhau hay khong
function checkpwd($pwd,$pwdConfirm) {
    if ( $pwd !== $pwdConfirm) {
        $result = true;
    }
    else
    {
        $result = false;
    }
    return $result;
}


//check username co ton tai trong he thong chua
function checkUser($conn,$username) {

    $sql  = "SELECT * FROM account WHERE username=?;";
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


//sau khi kt day du thi tao tk moi  
function createUser($conn,$name,$username,$pwd,$email,$phone,$account_type) {

    settype($account_id,'int');
    $decent_id = (int) $account_type;
    $default_state = 1;
    $date = date('Y-m-d H:i:s');
    $add_address = 'no address';
    settype($username,'string');

    $sql1  = "INSERT INTO account (username,password,date,decent_id,state) VALUES(?,?,?,?,?);";
    $stmt1 = mysqli_stmt_init($conn);

    mysqli_stmt_prepare($stmt1, $sql1);

    // $hashedPwd = password_hash($pwd,PASSWORD_DEFAULT);
    mysqli_stmt_bind_param($stmt1,'sssii',$username,$pwd,$date,$decent_id,$default_state);
    mysqli_stmt_execute($stmt1);
    mysqli_stmt_close($stmt1);
        
        $user = checkUser($conn, $username);
        $account_id =(int) $user['account_id'];

         if ($decent_id == 1)
            {
                $sql2  ="INSERT INTO customer (account_id,name,email,phone,address) VALUE(?,?,?,?,?);";
                $stmt2 = mysqli_stmt_init($conn);
                    mysqli_stmt_prepare($stmt2, $sql2);

                    mysqli_stmt_bind_param($stmt2,'issis',$account_id,$name,$email,$phone,$add_address);
                    mysqli_stmt_execute($stmt2);
                    mysqli_stmt_close($stmt2);

                    header("location:../admin.php?fname=account&feature=1&add=0&errorAdd=none");  

            } else if ($decent_id == 2 || $decent_id == 3) {

                $sql3  ="INSERT INTO staff (account_id,staff_name,email,phone,address) VALUE(?,?,?,?,?);";
                $stmt3 = mysqli_stmt_init($conn);
                mysqli_stmt_prepare($stmt3, $sql3);

                mysqli_stmt_bind_param($stmt3,'issis',$account_id,$name,$email,$phone,$add_address);
                mysqli_stmt_execute($stmt3);
                mysqli_stmt_close($stmt3);

                header("location:../admin.php?fname=account&feature=1&add=0&errorAdd=none");  
            }
        
} 
