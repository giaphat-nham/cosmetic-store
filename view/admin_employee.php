<script type="text/javascript">
function updateForm() {
    document.getElementById("Update_overlay").style.display='flex';
}

function close_form() {
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

    if(isset($_GET['update'])){
        $user = $_GET['update'];
        $sql1 = "SELECT staff_id,account_id,staff_name,email,phone,address FROM staff WHERE staff_id = '$user';";
        $result1 = mysqli_query($conn, $sql1);
        $data = mysqli_fetch_array($result1);
    
    }


?>

<div id="Update_overlay">
    <div class="modal">
        <div class="btn-cancel" onclick="close_form()">&times;</div>
        <div class="title">Cập Nhật Tài Khoản</div>
        <form action="model/Employee_update.php" method="post">
            <div class="input">
                <label for="employee_id">ID:</label> <p><?php echo $data['staff_id']?></p>
                <input type="text" name="employee_id" style="visibility: hidden;" value="<?php echo $data['staff_id'] ?> " >
            </div>
            <div class="input">
                <label for="name">Họ Tên:</label>
                <input type="text" name="name">
            </div>
            <div class="input">
                <label for="email">Email:</label>
                <input type="text" name="email">
            </div>
            <div class="input">
                <label for="address">Địa chỉ</label>
                <input type="text" name="address">
            </div>
            <div class="input">
                <label for="phone">Số Điện Thoại</label>
                <input type="text" name="phone">
            </div>
            <button type="submit">Cập Nhật</button>
                <?php 
                        if (isset($_GET["error"]))
                        {  
                            echo '<script type="text/javascript">registerform();</script>';
                            if($_GET["error"]=="phone"){
                                echo "<p> Số Điện thoại không hợp lệ!!!</p>";
                            }
                            if($_GET["error"]=="email"){
                                echo "<p> Email Không Hợp lệ!!!</p>";
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

<?php
        $sql = "SELECT staff_id,account_id,staff_name,email,phone,address from staff ";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($result);
        
        echo"<table>
        <tr>
        <th>ID</th>
        <th>Tên Nhân Viên</th>
        <th>Email</th>
        <th>Số Điện Thoại</th>
        <th>Địa Chỉ</th>
        <th></th>
        </tr>";
        while ($row = mysqli_fetch_array($result)) {
            echo "<tr>";
            echo "<td>" . $row['staff_id'] . "</td>";
            echo "<td>" . $row['staff_name'] . "</td>";
            echo "<td>" . $row['email'] . "</td>";
            echo "<td>" . $row['phone'] . "</td>";
            echo "<td>" . $row['address'] . "</td>";

            echo "<td>" . "<a href='./admin.php?fname=employee&feature=8&delete='".$row['account_id']."'><span class='material-icons-outlined'>delete</span></a>"
                . "<a href='./admin.php?fname=employee&feature=8&update=".$row['staff_id']."'><span class='material-icons-outlined'>settings</span></a>" . "</td>";
            echo "</tr>";
        }
        echo "</table>";
        ?>