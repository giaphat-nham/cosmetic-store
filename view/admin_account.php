<script type="text/javascript">
function updateForm() {
    document.getElementById("add_overlay").style.display='none';
    document.getElementById("Update_overlay").style.display='flex';
}
function addForm() {
    document.getElementById("add_overlay").style.display='flex';
    document.getElementById("Update_overlay").style.display='none';
}
function close_form() {
    document.getElementById("add_overlay").style.display='none';
    document.getElementById("Update_overlay").style.display='none';
}
</script>

<?php
        $conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
        if (!$conn){
            die("connection fail: ".mysqli_connect_error());
        }
?>

<?php 

    if(isset($_GET['del'])){
        $state = $_GET['del'];
        if ($state == 'succcess'){
            echo '<script type="text/javascript"> alert("delete Success")</script>';
        }
    }


?>

<div id="add_overlay">
    <div class="modal">
        <div class="btn-cancel" onclick="close_form()">&times;</div>
        <div class="title">Đăng ký</div>
        <form action="model/account_add.php" method="post">
            <div class="input">
                <label for="name">Họ Tên:</label>
                <input type="text" name="name">
            </div>
            <div class="input">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" name="username">
            </div>
            <div class="input">
                <label for="password">Mật khẩu:</label>
                <input type="password" name="password">
            </div>
            <div class="input">
                <label for="passwordConfirm">Xác nhận mật khẩu:</label>
                <input type="password" name="passwordConfirm">
            </div>
            <div class="input">
                <label for="email">Email:</label>
                <input type="text" name="email">
            </div>
            <div class="input">
                <label for="phone">Số điện thoại:</label>
                <input type="text" name="phone">
            </div>
            <label for='account_type'>Chọn quyền</label> <select id='account_type' name='account_type'> <option value='1'>Khách Hàng</option> <option value='2'>Admin</option> <option value='3'>Nhân viên</option></select>
            <button type="submit">Thêm tài Khoản</button>
                <?php 
                        if (isset($_GET["errorAdd"]))
                        {  
                            echo '<script type="text/javascript">addForm();</script>';
                            if($_GET["errorAdd"]=="empty"){
                                echo "<p> xin vui lòng nhập đầy đủ thông tin!!!</p>";
                            }
                            if($_GET["errorAdd"]=="user"){
                                echo "<p> tên đăng nhập đã được đăng kí!!!</p>";
                            }
                            if($_GET["errorAdd"]=="password"){
                                echo "<p> mật khẩu không khớp!!!</p>";
                            }
                            if($_GET["errorAdd"]=="notEmail"){
                                echo "<p> Email không hợp lệ!!!</p>";
                            }
                            if($_GET["errorAdd"]=="notPhone"){
                                echo "<p> Số điện thoại không hợp lệ!!!</p>";
                            }
                            if($_GET["errorAdd"]=="none"){
                                echo "<p> Tạo thành công</p>";
                            }
                        }
                ?>
        </form>
    </div>
</div>

<?php 

    if(isset($_GET['update'])){
        $user = $_GET['update'];
        $sql = "SELECT account_id,username,password,decent_id from account where account_id = $user;";
        $result = mysqli_query($conn, $sql);
        $data = mysqli_fetch_array($result);
    
    }


?>

<div id="Update_overlay">
    <div class="modal">
        <div class="btn-cancel" onclick="close_form()">&times;</div>
        <div class="title">Cập Nhật Tài Khoản</div>
        <form action="model/account_update.php" method="post">
            <div class="input">
                <label for="account_id">ID:</label> <p><?php echo $data['account_id']?></p>
                <input type="text" name="account_id" style="visibility: hidden;" value="<?php echo $data['account_id']?>" >
            </div>
            <div class="input">
                <label for="username">Tên đăng nhập:</label> <p><?php echo $data['username']?> </p>
                <input type="text" name="username" style="visibility: hidden;" value="<?php echo $data['username'] ?> ">
            </div>
            <div class="input">
                <label for="newPass">Mật khẩu Mới:</label>
                <input type="password" name="newPass">
            </div>
            <div class="input">
                <label for="newPassConfir">Xác nhận mật khẩu:</label>
                <input type="password" name="newPassConfir">
            </div>
            <?php
                $type = $data['decent_id'];
                if($type ==1){
                    echo "<label for='account_type'>Chọn quyền</label> <select id='account_type' name='account_type'> <option value='1' selected >Khách Hàng</option> <option value='2'>Admin</option> <option value='3'>Nhân viên</option></select>";
                } else if($type ==2){
                    echo "<label for='account_type'>Chọn quyền</label> <select id='account_type' name='account_type'> <option value='1'>Khách Hàng</option> <option value='2' selected >Admin</option> <option value='3'>Nhân viên</option></select>";
                } else if($type ==3){
                    echo "<label for='account_type'>Chọn quyền</label> <select id='account_type' name='account_type'> <option value='1'>Khách Hàng</option> <option value='2'>Admin</option> <option value='3' selected>Nhân viên</option></select>";
                }
            ?>
            <button type="submit">Cập Nhật</button>
                <?php 
                        if (isset($_GET["error"]))
                        {  
                            echo '<script type="text/javascript">registerform();</script>';
                            if($_GET["error"]=="empty"){
                                echo "<p> xin vui lòng nhập đầy đủ thông tin!!!</p>";
                            }
                            if($_GET["error"]=="confirm"){
                                echo "<p> Mật Khẩu Không khớp!!!</p>";
                            }
                            if($_GET["error"]=="update"){
                                echo "<p> Cập nhật không thành công!!!</p>";
                            }
                            if($_GET["error"]=="none"){
                                echo "<p>Cập Nhât thành công!!!</p>";
                            }
                        }
                ?>
        </form>
    </div>
</div>

<?php 

if(isset($_GET['update'])){
    echo "<script type='text/javascript'> updateForm() </script>";
}
?>

<div class="button-add"><a href="#" onclick="addForm()"><span class="material-icons-outlined"> add_circle_outline </span>Thêm tài khoản</a></div>

<?php
        
        $sql = "SELECT account_id,username,password,decent_id from account ";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($result);
        
        echo "<table>
        <tr>
        <th>ID</th>
        <th>Tên tài khoản</th>
        <th>Mât Khẩu</th>
        <th>Loại tài Khoảng</th>
        <th></th>
        </tr>";
        while ($row = mysqli_fetch_array($result)) {
            echo "<tr>";
            echo "<td>" . $row['account_id'] . "</td>";
            echo "<td>" . $row['username'] . "</td>";
            echo "<td>" . $row['password'] . "</td>";
             if($row['decent_id']==1) {
                echo "<td> Khách Hàng </td>";
            } else { if($row['decent_id']==2) {
                echo "<td> Admin </td>";
                } else { if($row['decent_id']==3) {
                    echo "<td>Nhân Viên </td>";
                    }
                }
            }
            echo "<td>" . "<a href='./model/account_delete.php?act=delete&user=". $row['account_id'] . "&place=account'><span class='material-icons-outlined'>delete</span> </a>"
                 . "<a href='./admin.php?fname=account&feature=1&update=".$row['account_id']."'><span class='material-icons-outlined'>settings</span></a>" . "</td>";
            echo "</tr>";
        }
        echo "</table>";
        ?>