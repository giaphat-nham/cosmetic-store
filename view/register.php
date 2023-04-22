<script type="text/javascript">
function registerform() {
    document.getElementById("login_overlay").style.display='none';
    document.getElementById("register_overlay").style.display='flex';
}
</script>
<div id="register_overlay">
    <div class="modal" id="register">
        <div class="btn-cancel" onclick="close_form()">&times;</div>
        <div class="title">Đăng ký</div>
        <form action="model/register.inc.php" method="post">
            <div class="input">
                <label for="name">Họ và tên:</label>
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
            <button type="submit">Đăng ký</button>
                <?php 
                        if (isset($_GET["regiserror"]))
                        {  
                            echo '<script type="text/javascript">registerform();</script>';
                            if($_GET["regiserror"]=="regisempty"){
                                echo "<p> xin vui lòng nhập đầy đủ thông tin!!!</p>";
                            }
                            if($_GET["regiserror"]=="usertaken"){
                                echo "<p> tên đăng nhập đã được đăng kí!!!</p>";
                            }
                            if($_GET["regiserror"]=="pwdMatch"){
                                echo "<p> mật khẩu không khớp!!!</p>";
                            }
                            if($_GET["regiserror"]=="notEmail"){
                                echo "<p> Email không hợp lệ!!!</p>";
                            }
                            if($_GET["regiserror"]=="notPhone"){
                                echo "<p> Số điện thoại không hợp lệ!!!</p>";
                            }
                            if($_GET["regiserror"]=="regisstmtfailted"){
                                echo "<p> Lỗi hệ thống!!!</p>";
                            }
                            if($_GET["regiserror"]=="none"){
                                echo "<p> Đăng kí thành công</p>";
                            }
                        }
                ?>
        </form>
        <div class="other-option">
        </div>
        <button type="button" onclick=loginform()>Đăng nhập</a></button>
    </div>
</div>