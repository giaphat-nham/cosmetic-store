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
    <script defer src="./js/script.js" ></script>
    <script defer src="./js/product.js"></script>
    <title>FLORA | PRODUCT</title>
</head>

<body>
    <div class="container">
        <?php include("./template/header.php") ?>
        <div class="content">
            <div class="grid-col-1">
                <div class="filter">
                    <div class="catalog-nav">
                        <a href="#">Nhóm sản phẩm lớn</a>
                        <ul>
                            <li><a href="#">Nhóm sản phẩm nhỏ</a></li>
                            <li><a href="#">Nhóm sản phẩm nhỏ</a></li>
                            <li><a href="#">Nhóm sản phẩm nhỏ</a></li>
                            <li><a href="#">Nhóm sản phẩm nhỏ</a></li>
                            <li><a href="#">Nhóm sản phẩm nhỏ</a></li>
                            <li><a href="#">Nhóm sản phẩm nhỏ</a></li>
                            <li><a href="#">Nhóm sản phẩm nhỏ</a></li>
                            <li><a href="#">Nhóm sản phẩm nhỏ</a></li>
                        </ul>
                    </div>
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
                            <div class="product-type-filter radio-button-group">
                                <label for="product-type" class="label">Danh mục sản phẩm:</label>
                                <div class="radio-option">
                                    <input type="radio" name="product-type" id="face-care" value="face">
                                    <label for="face-care">Chăm sóc da mặt</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" name="product-type" id="body-care" value="body">
                                    <label for="body-care">Chăm sóc cơ thể</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" name="product-type" id="makeup" value="makeup">
                                    <label for="makeup">Makeup</label>
                                </div>
                            </div>
                            <div class="product-brands-filter radio-button-group">
                                <label for="brand" class="label">Thương hiệu:</label>
                                <div class="radio-option">
                                    <input type="radio" name="brand" id="cocoon" value="cocoon">
                                    <label for="face-care">Cocoon</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" name="brand" id="bioderma" value="bioderma">
                                    <label for="body-care">Bioderma</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" name="brand" id="La Roche Posay" value="La Roche Posay">
                                    <label for="makeup">La Roche Posay</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="grid-col-2">
                <div class="catalog-title">
                    <div class="title">Nhóm sản phẩm</div>
                    <div class="product-sort">
                        <select name="product-sort" id="">
                            <option value="1">A - Z</option>
                            <option value="2">Z - A</option>
                            <option value="3">Giá &uarr;</option>
                            <option value="4">Giá &darr;</option>
                        </select>
                    </div>
                </div>
                <div class="product-catalog-container">
                    <div class="product-catalog">
                        <div class="product-cell">
                            <div class="product">
                                <img src="./img/png/brand.png" alt="">
                                <div class="product-price">
                                    <div class="price">300000</div>
                                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline"
                                        viewBox="0 0 24 24" width="22" height="22">
                                        <path
                                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                                    </svg>
                                </div>
                                <div class="product-brand">Tên thương hiệu</div>
                                <div class="product-name">Tên sản phẩm</div>
                            </div>
                        </div>
                        <div class="product-cell">
                            <div class="product">
                                <img src="./img/png/brand.png" alt="">
                                <div class="product-price">
                                    <div class="price">300000</div>
                                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline"
                                        viewBox="0 0 24 24" width="22" height="22">
                                        <path
                                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                                    </svg>
                                </div>
                                <div class="product-brand">Tên thương hiệu</div>
                                <div class="product-name">Tên sản phẩm</div>
                            </div>
                        </div>
                        <div class="product-cell">
                            <div class="product">
                                <img src="./img/png/brand.png" alt="">
                                <div class="product-price">
                                    <div class="price">300000</div>
                                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline"
                                        viewBox="0 0 24 24" width="22" height="22">
                                        <path
                                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                                    </svg>
                                </div>
                                <div class="product-brand">Tên thương hiệu</div>
                                <div class="product-name">Tên sản phẩm</div>
                            </div>
                        </div>
                        <div class="product-cell">
                            <div class="product">
                                <img src="./img/png/brand.png" alt="">
                                <div class="product-price">
                                    <div class="price">300000</div>
                                    <svg class="heart checked" xmlns="http://www.w3.org/2000/svg" id="Outline"
                                        viewBox="0 0 24 24" width="22" height="22">
                                        <path
                                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                                    </svg>
                                </div>
                                <div class="product-brand">Tên thương hiệu</div>
                                <div class="product-name">Tên sản phẩm</div>
                            </div>
                        </div>
                        <div class="product-cell">
                            <div class="product">
                                <img src="./img/png/brand.png" alt="">
                                <div class="product-price">
                                    <div class="price">300000</div>
                                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline"
                                        viewBox="0 0 24 24" width="22" height="22">
                                        <path
                                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                                    </svg>
                                </div>
                                <div class="product-brand">Tên thương hiệu</div>
                                <div class="product-name">Tên sản phẩm</div>
                            </div>
                        </div>
                        <div class="product-cell">
                            <div class="product">
                                <img src="./img/png/brand.png" alt="">
                                <div class="product-price">
                                    <div class="price">300000</div>
                                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline"
                                        viewBox="0 0 24 24" width="22" height="22">
                                        <path
                                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                                    </svg>
                                </div>
                                <div class="product-brand">Tên thương hiệu</div>
                                <div class="product-name">Tên sản phẩm</div>
                            </div>
                        </div>
                    </div>
                    <div class="page-nav">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#" class="active">3</a>
                        <a href="#">2</a>
                        <a href="#">2</a>
                        <a href="#">2</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <?php include("./template/footer.php") ?>
    </div>
</body>

</html>