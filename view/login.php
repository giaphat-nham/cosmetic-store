<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
function loginform() {
    document.getElementById("login_overlay").style.display='flex';
    document.getElementById("register_overlay").style.display='none';
}
</script>

<div id="login_overlay">
    <div class="modal" id="login">
        <div class="btn-cancel" onclick="close_form()">&times;</div>
        <div class="title">Đăng nhập</div>
        <form  method="post" id="loginForm">
            <div class="input">
                <label for="username">Tên đăng nhập:</label>
                <input type="text" name="username">
            </div>
            <div class="input">
                <label for="password">Mật khẩu:</label>
                <input type="password" name="password">
            </div>
            <button type="submit">Đăng nhập</button>
            <div class="errorMessage"></div>
            <?php 
                        if (isset($_GET["loginerror"]))
                        {  
                            echo '<script type="text/javascript">loginform();</script>';
                            if($_GET["loginerror"]=="loginEmpty"){
                                echo "<p> xin vui lòng nhập đầy đủ thông tin đăng nhập!!!</p>";
                            }
                            if($_GET["loginerror"]=="wrongUser"){
                                echo "<p>Tên đăng nhập không chính xác!!!</p>";
                            }
                            if($_GET["loginerror"]=="wrongPass"){
                                echo "<p> mật khẩu không đúng!!!</p>";
                            }
                            if($_GET["loginerror"]=="loginstmtfailted"){
                                echo "<p> Lỗi hệ thống!!!</p>";
                            }
                        }
                ?>
        </form>
        <div class="other-option">

        </div>
        <button type="button" onclick="registerform()">Đăng ký</button>
    </div>


    <!-- <div class="modal" id="register">
        <div class="btn-cancel">&times;</div>
        <div class="title">Đăng ký</div>
        <form action="" method="post">
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
        </form>
        <div class="other-option">
        </div>
        <button type="button"><ahref="login.php">Đăng nhập</a></button>
    </div> -->
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#loginForm").on('submit',function(e){
            e.preventDefault();
            $.ajax({
                type: "POST",
                url:"model/ajax_login.php",
                data: new FormData(this),
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,

                success:function(response){
                     $(".errorMessage").css("display","block");

                     if (response.status == 1){;
                        $("#loginForm")[0].reset();
                        $(".errorMessage").html('<p>' + response.message + '</p>');
                    } else{
                        $(".errorMessage").html('<p>' + response.message + '</p>');
                    }
                }  
            })
        })
    })
</script>