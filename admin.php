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

        <div class="header">
            <?php include("view/admin_header.php") ?>
        </div>

        <div id="sidebar">
            <?php include("view/admin_sidebar.php") ?>
        </div>

        <div class="main-container">
            <?php include("./controller/folder_title_space.php")
                ?>
            <?php
            if (isset($_GET['act'])) {
                switch ($_GET['act']) {
                    case "statistic":
                        include("./view/admin_statistic.php");
                        break;
                    case "product":
                        include("./view/admin_product.php");
                        break;
                    case "order":
                        include("./view/admin_order.php");
                        break;
                    case "decentralization":
                        include("./view/admin_decentralization.php");
                        break;
                    case "account":
                        include("./view/admin_account.php");
                        break;
                    case "employee":
                        include("./view/admin_employee.php");
                        break;
                    case "brand":
                        include("./view/admin_brand.php");
                        break;
                    default:
                        include("./view/admin_statistic.php");
                        break;
                }
            } else {
                include("./view/admin_statistic.php");
            }
            ?>
        </div>

    </div>
    <script src="js/admin.js"></script>

</body>

</html>