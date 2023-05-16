<div class="product-info-container">
    <?php $rowProduct = $conn->loadProductByID($_GET['productID']) ?>
    <?php $resultBrand = $conn->loadProductBrand() ?>
    <?php $resultTypeID = $conn->admin_LoadProductType() ?>

    <span class="font-weight-bold">Mã sản phẩm:</span>
    <div class="product-id">
        <?php echo ("$rowProduct[product_id]") ?>
    </div>

    <span for="product-nme" class="font-weight-bold">Tên sản phẩm:</span>
    <div class="product-name">
        <?php echo ("$rowProduct[product_name]") ?>
    </div>
    <span for="product-img" class="font-weight-bold">Hình ảnh:</span>
    <div class="product-img">
        <?php echo ("<img src='./img/product/" . "$rowProduct[img]" . "' alt='Hình sản phẩm'>") ?>
    </div>

    <spa class="font-weight-bold" n>Thương hiệu:</spa>
    <div class="product-brand">
        <?php echo ("$rowProduct[brand_name]") ?>
    </div>
    <span for="product-type" class="font-weight-bold">Loại sản phẩm:</span>
    <div class="product-type">
        <?php echo ("$rowProduct[product_type_name]") ?>
    </div>

    <span for="product-info" class="font-weight-bold">Mô tả:</span>
    <div class="product-info">
        <?php echo ("$rowProduct[info]") ?>
    </div>

    <span for="product-ingredient" class="font-weight-bold">Thành phần:</span>
    <div class="product-ingredient">
        <?php echo ("$rowProduct[ingredient]") ?>
    </div>

    <span for="product-skin-type" class="font-weight-bold">Loại da:</span>
    <div class="product-skin-type">
        <?php
        $skinType = $rowProduct['skin_type'];
        switch ($skinType) {
            case "oil";
                echo ("Da dầu");
                break;
            case "all":
                echo ("Mọi loại da");
                break;
            case "dry":
                echo ("Da khô");
                break;
            case "normal":
                echo ("Da thường");
                break;
        }
        ?>
    </div>

    <span for="product-volume" class="font-weight-bold">Thể tích:</span>
    <div class="product-volume">
        <?php echo ("$rowProduct[volume]") ?>
    </div>

    <span for="product-price" class="font-weight-bold">Giá:</span>
    <div class="product-price">
        <?php echo ("$rowProduct[price]") ?>
    </div>

    <span for="product-quantity" class="font-weight-bold">Số lượng:</span>
    <div class="product-quantity">
        <?php echo ("$rowProduct[quantity]") ?>
    </div>



</div>