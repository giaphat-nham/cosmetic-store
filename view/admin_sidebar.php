<div class="sidebar-title">
    <div class="sidebar-brand">
        <a href="admin.php"><img src="./img/favicon.png" alt=""><span>FLORA</span></a>
    </div>
    <span class="material-icons-outlined" onclick="closeSidebar()">close</span>
</div>

<ul class="sidebar-list">
    <?php

    if (isset($_SESSION['account_id'])) {
        $decent_id = $conn->getDecentByAccountID($_SESSION['account_id']);


        switch ($decent_id) {
            case "2":
                echo ("<li class='sidebar-list-item'>
        <a href='./admin.php?fname=decentralization&feature=3'><span
                class='material-icons-outlined'>verified_user</span><span>Quyền</span></a>
    </li>
    <li class='sidebar-list-item'>
        <a href='./admin.php?fname=account&feature=1'><span
                class='material-icons-outlined'>manage_accounts</span><span>Tài khoản</span></a>
    </li>");
                break;
            case "3":
                echo "<li class='sidebar-list-item'>
        <a href='./admin.php?fname=statistic&feature=10'> <span class='material-icons-outlined'>bar_chart</span>
            <span>Thống kê</span></a>
    </li>
    <li class='sidebar-list-item'>
        <a href='./admin.php?fname=product&feature=2'><span class='material-icons-outlined'>inventory_2</span><span>Sản
                phẩm</span></a>
    </li>
    <li class='sidebar-list-item'>
        <a href='./admin.php?fname=order&feature=6'><span class='material-icons-outlined'>inventory</span><span>Đơn
                hàng</span></a>
    </li>
    <li class='sidebar-list-item'>
        <a href='./admin.php?fname=employee&feature=9'> <span
                class='material-icons-outlined'>perm_contact_calendar</span><span>Nhân viên</span></a>
    </li>

    <li class='sidebar-list-item'>
        <a href='./admin.php?fname=customer&feature=8'> <span class='material-icons-outlined'>
                contacts
            </span><span>Khách hàng</span></a>
    </li>";
                break;
        }
    }
    ?>
</ul>