<div class="catalog-title">
    <div class="title">
        <?php
        if (isset($_GET['nav'])) {
            switch ($_GET['nav']) {
                case "brand":
                    echo $conn->getBrandDisplayName($_GET['brand']);
                    break;
                default:
                    echo $conn->getTypeDisplayName($_GET['type']);
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
            } else {
                $conn->loadProductType();
            }
        }
        ?>
    </div>
    <div class="page-nav">
        <?php
        $conn->loadPageNavigation();
        ?>
        <script type="text/javascript">
            function sendPageNumber(nav, navType, pageNum) {
                const xmlhttp = new XMLHttpRequest();
                xmlhttp.onload = function () {
                    document.querySelector(".product-catalog.product-page").innerHTML = this.responseText;
                }
                xmlhttp.open("GET", "./model/load_product_page.php?nav=" + nav + "&navType=" + navType + "&pageNum=" + pageNum);
                xmlhttp.send();
            }
        </script>
    </div>
</div>