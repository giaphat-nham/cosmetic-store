<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/product_details.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico">
    <script src="./js/script.js" async></script>
    <title>FLORA | PRODUCT</title>
</head>

<body>
    <div class="container">
        <?php include("./template/header.php"); ?>
        <div class="content">
            <div class="grid-col">
                <?php include("./template/product_main_info.php") ?>
                <?php include("./template/product_discription.php") ?>
                <div class="claim">
                    <div class="title">FLORA đảm bảo toàn bộ sản phẩm đều là hàng thật</div>
                    <ul class="claims">
                        <li href="./product.php">Hàng trộn sẽ không thể xuất hoá đơn đỏ (VAT) 100% được do có hàng không
                            nguồn gốc trong đó.</li>
                        <li href="./product.php">Tại FLORA, 100% hàng bán ra sẽ được xuất hoá đơn đỏ cho dù khách hàng
                            có lấy hay không. Nếu có nhu cầu lấy hoá đơn đỏ, quý khách vui lòng lấy trước 22h cùng ngày.
                            Vì sau 22h, hệ thống FLORA sẽ tự động xuất hết hoá đơn cho những hàng hoá mà khách hàng
                            không đăng kí lấy hoá đơn.</li>
                        <li href="./product.php">Do xuất được hoá đơn đỏ 100% nên đảm bảo 100% hàng tại FLORA là hàng
                            chính hãng có nguồn gốc rõ ràng.</li>
                    </ul>
                </div>
            </div>
            <div class="grid-col" id="2">
                <?php include("./template/product_side_info.php") ?>
                <?php include("./template/product_recommendation.php") ?>
            </div>
        </div>
        <?php include("./template/footer.php"); ?>
        <?php include(".template/login.php") ?>
    </div>

</body>

</html>