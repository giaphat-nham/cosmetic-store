<div class="catalog-title">
    <div class="title">
        <?php
        if (isset($_GET['nav'])) {
            switch ($_GET['nav']) {
                case "brand":
                    echo $conn->getBrandDisplayName($_GET['brand']);
                    break;
                case "facecare":
                    echo "Sản phẩm chăm sóc da mặt";
                    break;
                case "bodycare":
                    echo "Sản phẩm chăm sóc cơ thể";
                    break;
                case "makeup":
                    echo "Sản phẩm Makeup";
                    break;
            }
        }
        ?>
    </div>
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
    <div class="product-catalog product-page">
        <?php
        if (isset($_GET['nav'])) {
            if ($_GET['nav'] == "brand") {
                $conn->loadProductsBrand();
            }
            else {
                
            }
        }
        ?>
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