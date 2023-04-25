<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <link rel="stylesheet" href="./css/admin.css">
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico">
    <title>Admin</title>
    <?php
    include("./model/db_connection.php");
    $conn = new DatabaseConnection("localhost", "root", "", "cosmetic_store");
    $conn->connect();
    ?>
</head>

<body>
    <div class="grid-container">
        <!-- HEADER -->
        <div class="header">
            <div class="menu-icon" onclick="openSidebar()">
                <a href="#"><span class="material-icons-outlined">menu</span></a>
            </div>
            <div class="header-left">
                <a href="#"><span class="material-icons-outlined">search</span></a>
            </div>
            <div class="header-right">
                <a href="#"> <span class="material-icons-outlined">account_circle</span></a>
                <a href="#"> <span class="material-icons-outlined">logout</span></a>
            </div>
        </div>

        <!-- HEADER -->
        <!-- STAR SIDE BAR -->
        <div id="sidebar">
            <div class="sidebar-title">
                <div class="sidebar-brand">
                    <a href="#"><img src="./img/favicon.png" alt="">FLORA</a>
                </div>
                <span class="material-icons-outlined" onclick="closeSidebar()">close</span>
            </div>

            <ul class="sidebar-list">
                <li class="sidebar-list-item">
                    <a href="#"> <span class="material-icons-outlined">bar_chart</span>Thống kê</a>
                </li>
                <li class="sidebar-list-item">
                    <a href="#"><span class="material-icons-outlined">inventory_2</span>Sản phẩm</a>
                </li>
                <li class="sidebar-list-item">
                    <a href="#"><span class="material-icons-outlined">inventory</span>Đơn hàng</a>
                </li>
                <li class="sidebar-list-item">
                    <a href="#"><span class="material-icons-outlined">verified_user</span>Quyền</a>
                </li>
                <li class="sidebar-list-item">
                    <a href="#"><span class="material-icons-outlined">manage_accounts</span>Tài khoản</a>
                </li>
                <li class="sidebar-list-item">
                    <a href="#"> <span class="material-icons-outlined">perm_contact_calendar</span>Nhân viên</a>
                </li>
                <li class="sidebar-list-item">
                    <a href="#"> <span class="material-icons-outlined">label</span>Nhãn hàng</a>
                </li>
            </ul>

        </div>
        <!-- END SIDE BAR -->
        <!-- STAR MAIN -->
        <div class="main-container">
            <div class="main-title">
                <p class="text-primary font-weight-bold">THỐNG KÊ</p>
            </div>

            <div class="main-cards">
                <div class="card">
                    <div class="card-inner">
                        <p class="text-primary">SẢN PHẨM</p>
                        <span class="material-icons-outlined">inventory_2</span>
                    </div>
                    <span class="text-primary font-weight-bold">0</span>
                </div>

                <div class="card">
                    <div class="card-inner">
                        <p class="text-primary">ĐƠN HÀNG ĐANG XỬ LÝ</p>
                        <span class="material-icons-outlined">shopping_cart</span>
                    </div>
                    <span class="text-primary font-weight-bold">0</span>
                </div>

                <div class="card">
                    <div class="card-inner">
                        <p class="text-primary">ĐƠN HÀNG ĐÃ HOÀN THÀNH</p>
                        <span class="material-icons-outlined">add_shopping_cart</span>
                    </div>
                    <span class="text-primary font-weight-bold">0</span>
                </div>
                <div class="card">
                    <div class="card-inner">
                        <p class="text-primary">DOANH SỐ</p>
                        <span class="material-icons-outlined">paid</span>
                    </div>
                    <span class="text-primary font-weight-bold">0</span>
                </div>

            </div>
        </div>

        <!-- END MAIN -->



    </div>
    <script src="js/admin.js"></script>

</body>

</html>