<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/product.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="./img/favicon.ico">
    <script defer src="./js/script.js"></script>
    <script defer src="./js/product.js"></script>
    <title>FLORA | PRODUCT</title>
</head>

<body>
    <div class="container">
        <?php include("./template/header.php") ?>
        <div class="content">
            <div class="grid-col-1">
                <div class="filter">
                    <?php include("./template/catalog_nav.php")?>
                    <div class="product-filter">
                        <form action="" method="get">
                            <label for="price-range" class="label">Khoảng giá:</label>
                            <div class="price-range-group">
                                <input type="range" min="0" max="1000000" step="10000" name="price-range-left">
                                <input type="range" min="1000000" max="2000000" step="10000" name="price-range-right">
                            </div>
                            <div class="price-range-display">0 - 500000</div>
                            <div class="radio-button-group">
                                <label for="skin-type" class="label">Chọn loại da phù hợp:</label>
                                <div class="radio-option">
                                    <input type="radio" name="skin-type" id="oily" value="oily">
                                    <label for="oily">Da dầu</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" name="skin-type" id="dry" value="dry">
                                    <label for="oily">Da khô</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" name="skin-type" id="all" value="all">
                                    <label for="oily">Mọi loại da</label>
                                </div>
                            </div>
                            <?php include("./template/product_type_filter.php") ?>
                            <?php include("./template/product_brands_filter.php") ?>
                        </form>
                    </div>
                </div>
            </div>
            <div class="grid-col-2">
                <?php include("./template/products_display.php")?>
            </div>
        </div>

    </div>
    <?php include("./template/footer.php") ?>
    <?php include("./template/login.php") ?>
    </div>
</body>

</html>