<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/product.css">
    <link rel="stylesheet" href="./css/product_details.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico">
    <title>FLORA</title>
    <script defer src="./js/script.js"></script>
    <?php
    include("./model/db_connection.php");
    $conn = new DatabaseConnection("localhost", "root", "", "cosmetic_store");
    $conn->connect();
    ?>
</head>

<body>
    <div class="container">
        <?php include("./view/header.php") ?>
        <?php
        if (isset($_GET['act'])) {
            switch ($_GET['act']) {
                case "product":
                    include("./view/product.php");
                    break;
                case "productDetails":
                    include("./view/product_details.php");
                    break;
                default:
                    include("./template/home_banners.php");
                    break;
            }
        } else {
            include("./template/home_banners.php");
        }
        ?>
        <?php include("./view/footer.php") ?>
        <?php include("./view/login.php") ?>
    </div>
</body>

</html>