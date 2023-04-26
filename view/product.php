<div class="content product-page">
    <div class="grid-col-1">
        <div class="filter">
            <?php include("./controller/catalog_nav.php") ?>
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
                    <?php
                    if (isset($_GET["nav"])) {
                        if ($_GET["nav"] == "brand") {
                            include("./controller/product_type_filter.php");
                        } else {
                            include("./controller/product_brands_filter.php");
                        }
                    } else if (isset($_GET['txtSearch'])) {
                        include("./controller/product_type_filter.php");
                        include("./controller/product_brands_filter.php");
                    }
                    ?>
                    <div class="submit-filter-button">
                        <button class="filter" type="submit">Lọc</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="grid-col-2 product-page">
        <?php include("./controller/products_display.php") ?>
    </div>
</div>