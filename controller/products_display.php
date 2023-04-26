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
        } else if (isset($_GET['txtSearch'])) {
            if (trim($_GET['txtSearch']) != "")
                echo "Kết quả của \"" . $_GET['txtSearch'] . "\"";
            else {
                echo "Tất cả sản phẩm";
            }
        }
        ?>
    </div>
    <div class="product-sort">
        <select class="order-product" name="product-sort" onchange="updatePage()">
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
        if (isset($_GET['txtSearch'])) {
            $searchResult = $conn->getSearchResult($_GET['txtSearch']);
            $counter = 0;
            foreach ($searchResult as $result) {
                $counter++;
                echo "
                <a href='./index.php?act=productDetails&productId=" . $result['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $result['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($result['price'], 0, '', '.') . "</div>
                        <svg class='heart' xmlns='http://www.w3.org/2000/svg' id='Outline' viewBox='0 0 24 24' width='22'
                            height='22'>
                            <path
                                d='M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z' />
                        </svg>
                    </div>
                    <div class='product-brand'>" . $result['display_name'] . "</div>
                    <div class='product-name'>" . $result['product_name'] . "</div>
                </a>";
                if ($counter == 12)
                    break;
            }
        }
        ?>
    </div>
    <div class="page-nav">
        <?php
        if (!isset($_GET['txtSearch'])) {
            $conn->loadPageNavigation();
        } else if (isset($_GET['txtSearch'])) {
            $searchResult = $conn->getSearchResult($_GET['txtSearch']);
            $totalResult = sizeof($searchResult);
            $totalResult % 12 == 0 ? $pageNumber = $totalResult / 12 : $pageNumber = $totalResult / 12 + 1;

            for ($i = 1; $i <= $pageNumber; $i++) {
                echo "<button href='#' class='change-page' onclick=" . '"' . "changeSearchResultPage(this.innerHTML,'" . $_GET['txtSearch'] . "', this)" . '"' . ">$i</button>";
            }
        }
        echo "<script type='text/javascript'>
                    const pageChangeButton = document.querySelector('.change-page');
                    pageChangeButton.classList.add('active');
                </script>";
        ?>
        <script type="text/javascript">
            function sendPageNumber(nav, navType, pageNum, pageNav) {
                const xmlhttp = new XMLHttpRequest();
                const orderProduct = document.querySelector(".order-product");
                const pageNavs = document.querySelectorAll(".change-page");
                xmlhttp.onload = function () {
                    document.querySelector(".product-catalog.product-page").innerHTML = this.responseText;
                }
                xmlhttp.open("GET", "./model/load_product_page.php?nav=" + nav + "&navType=" + navType + "&pageNum=" + pageNum + "&order=" + orderProduct.value);
                xmlhttp.send();
                pageNavs.forEach(page => {
                    if (page.classList.contains("active")) {
                        page.classList.remove("active");
                    }
                })
                pageNav.classList.add("active");
            }

            function updatePage() {
                const pageNav = document.querySelector(".change-page.active");
                const nav = pageNav.dataset.nav;
                const navType = pageNav.dataset.navType;
                const pageNum = pageNav.innerHTML;

                sendPageNumber(nav, navType, pageNum, pageNav);
            }

            function changeSearchResultPage(pageNum, key, pageNav) {
                const xmlhttp = new XMLHttpRequest();
                const pageNavs = document.querySelectorAll(".change-page");
                xmlhttp.onload = function () {
                    document.querySelector(".product-catalog.product-page").innerHTML = this.responseText;
                }
                xmlhttp.open("GET", "./model/load_search_page.php?txtSearch=" + key + "&pageNum=" + pageNum);
                xmlhttp.send();
                pageNavs.forEach(page => {
                    if (page.classList.contains("active")) {
                        page.classList.remove("active");
                    }
                })
                pageNav.classList.add("active");
            }
        </script>
    </div>
</div>