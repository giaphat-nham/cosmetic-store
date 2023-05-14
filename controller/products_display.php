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
            if (sizeof($searchResult) <= 0 || $_GET['txtSearch'] == "") {
                echo "<h3>Không có kết quả!</h3>";
            } else {
                $counter = 0;
                foreach ($searchResult as $result) {
                    $counter++;
                    echo "
                <a href='./index.php?act=productDetails&productId=" . $result['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $result['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($result['price'], 0, '', '.') . "&#8363;</div>
                    </div>
                    <div class='product-brand'>" . $result['display_name'] . "</div>
                    <div class='product-name'>" . $result['product_name'] . "</div>
                </a>";
                    if ($counter == 12)
                        break;
                }
            }
        }
        if (isset($_GET['skintype'])) {
            $conn->loadProductSkinType($_GET['skintype']);
        }
        ?>
    </div>
    <div class="page-nav">
        <?php
        if (!isset($_GET['txtSearch'])) {
            $conn->loadPageNavigation();
            echo "<script type='text/javascript'>
                    const pageChangeButton = document.querySelector('.change-page');
                    pageChangeButton.classList.add('active');
                </script>";
        } else if (isset($_GET['txtSearch'])) {
            $searchResult = $conn->getSearchResult($_GET['txtSearch']);
            if (sizeof($searchResult) > 0 && $_GET['txtSearch'] != "") {
                $totalResult = sizeof($searchResult);
                $totalResult % 12 == 0 ? $pageNumber = $totalResult / 12 : $pageNumber = $totalResult / 12 + 1;

                if (!($pageNumbers < 2)) {
                    for ($i = 1; $i <= $pageNumber; $i++) {
                        echo "<button class='change-page' data-search='" . $_GET['txtSearch'] . "' onclick=" . '"' . "changeSearchResultPage(this.innerHTML,'" . $_GET['txtSearch'] . "', this)" . '"' . ">$i</button>";
                    }
                }
            }
            echo "<script type='text/javascript'>
                    const pageChangeButton = document.querySelector('.change-page');
                    pageChangeButton.classList.add('active');
                </script>";
        }


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
                if (pageNav.dataset.nav && !pageNav.dataset.filter) {
                    const nav = pageNav.dataset.nav;
                    const navType = pageNav.dataset.navType;
                    const pageNum = pageNav.innerHTML;

                    sendPageNumber(nav, navType, pageNum, pageNav);
                }
                else if (pageNav.dataset.skinType && !pageNav.dataset.filter) {
                    const skinType = pageNav.dataset.skinType;
                    const pageNum = pageNav.innerHTML;

                    loadSkinTypePage(skinType, pageNum, pageNav);
                }
                else if (pageNav.dataset.search && !pageNav.dataset.filter) {
                    const pageNum = pageNav.innerHTML;
                    const key = pageNav.dataset.search;
                    changeSearchResultPage(pageNum, key, pageNav);
                }
                else if (pageNav.dataset.filter) {
                    const lRange = pageNav.dataset.leftRange;
                    const rRange = pageNav.dataset.rightRange;
                    let skinType = "";
                    if (pageNav.dataset.skinType) {
                        skinType = pageNav.dataset.skinType;
                    }
                    let brand = "";
                    if (pageNav.dataset.brand) {
                        brand = pageNav.dataset.brand;
                    }
                    let productType = "";
                    if (pageNav.dataset.productType) {
                        productType = pageNav.dataset.productType;
                    }
                    const filterFor = pageNav.dataset.filter;
                    let nav = "";
                    if (pageNav.dataset.nav) {
                        nav = pageNav.dataset.nav;
                    }
                    let navType = "";
                    if (pageNav.dataset.navType) {
                        navType = pageNav.dataset.navType;
                    }
                    let key = "";
                    if (pageNav.dataset.key) {
                        key = pageNav.dataset.key;
                    }
                    const pageNum = pageNav.innerHTML;
                    const orderProduct = document.querySelector(".order-product");
                    const xmlhttp = new XMLHttpRequest();
                    xmlhttp.onload = function () {
                        document.querySelector(".product-catalog.product-page").innerHTML = this.responseText;
                    }
                    xmlhttp.open("GET", "./model/filter_products.php?lrange=" + lRange + "&rrange=" + rRange + "&skintype=" + skinType + "&brand=" + brand + "&producttype=" + productType + "&filter=" + filterFor + "&order=" + orderProduct.value + "&nav=" + nav + "&navtype=" + navType + "&key=" + key + "&pageNum=" + pageNum);
                    xmlhttp.send();
                }
            }

            function changeSearchResultPage(pageNum, key, pageNav) {
                const xmlhttp = new XMLHttpRequest();
                const pageNavs = document.querySelectorAll(".change-page");
                const orderProduct = document.querySelector(".order-product");
                xmlhttp.onload = function () {
                    document.querySelector(".product-catalog.product-page").innerHTML = this.responseText;
                }
                xmlhttp.open("GET", "./model/load_search_page.php?txtSearch=" + key + "&pageNum=" + pageNum + "&order=" + orderProduct.value);
                xmlhttp.send();
                pageNavs.forEach(page => {
                    if (page.classList.contains("active")) {
                        page.classList.remove("active");
                    }
                })
                pageNav.classList.add("active");
            }

            function loadSkinTypePage(skinType, pageNum, pageNav) {
                const xmlhttp = new XMLHttpRequest();
                const pageNavs = document.querySelectorAll(".change-page");
                const orderProduct = document.querySelector(".order-product");
                xmlhttp.onload = function () {
                    document.querySelector(".product-catalog.product-page").innerHTML = this.responseText;
                }
                xmlhttp.open("GET", "./model/load_skintype_page.php?skintype=" + skinType + "&pageNum=" + pageNum + "&order=" + orderProduct.value);
                xmlhttp.send();
                pageNavs.forEach(page => {
                    if (page.classList.contains("active")) {
                        page.classList.remove("active");
                    }
                })
                pageNav.classList.add("active");
            }

            const filterButton = document.querySelector("button.filter");
            filterButton.addEventListener("click", e => filterProducts())

            function filterProducts() {
                const rangeInputs = document.querySelectorAll("input[type='range']");
                const leftRange = rangeInputs[0].max - rangeInputs[0].value;
                const rightRange = rangeInputs[1].value;

                const skinTypeButtons = document.querySelectorAll("input[type='radio'][name='skin-type']");
                let skinType = "";
                skinTypeButtons.forEach(button => {
                    if (button.checked) {
                        skinType = button.value;
                    }
                });

                const brandButtons = document.querySelectorAll("input[type='radio'][name='brand']");
                let brand = "";
                if (brandButtons) {
                    brandButtons.forEach(button => {
                        if (button.checked) {
                            brand = button.value;
                        }
                    });
                }

                const typeButtons = document.querySelectorAll("input[type='radio'][name='product-type']");
                let productType = "";
                if (typeButtons) {
                    typeButtons.forEach(button => {
                        if (button.checked) {
                            productType = button.value;
                        }
                    });
                }

                const pageNav = document.querySelector(".change-page");
                let filterFor = "";
                let nav = "";
                let navType = "";
                let key = "";
                if (pageNav.dataset.nav) {
                    filterFor = "nav";
                    nav = pageNav.dataset.nav;
                    navType = pageNav.dataset.navType;
                }
                else if (pageNav.dataset.search) {
                    filterFor = "search";
                    key = pageNav.dataset.search;
                }

                const orderProduct = document.querySelector(".order-product");
                const xmlhttp = new XMLHttpRequest();
                xmlhttp.onload = function () {
                    document.querySelector(".product-catalog.product-page").innerHTML = this.responseText;
                    loadFilterPageNav();
                }
                xmlhttp.open("GET", "./model/filter_products.php?lrange=" + leftRange + "&rrange=" + rightRange + "&skintype=" + skinType + "&brand=" + brand + "&producttype=" + productType + "&filter=" + filterFor + "&order=" + orderProduct.value + "&nav=" + nav + "&navtype=" + navType + "&key=" + key + "&pageNum=1");
                xmlhttp.send();
            }

            function loadFilterPageNav() {
                const rangeInputs = document.querySelectorAll("input[type='range']");
                const leftRange = rangeInputs[0].max - rangeInputs[0].value;
                const rightRange = rangeInputs[1].value;

                const skinTypeButtons = document.querySelectorAll("input[type='radio'][name='skin-type']");
                let skinType = "";
                skinTypeButtons.forEach(button => {
                    if (button.checked) {
                        skinType = button.value;
                    }
                });

                const brandButtons = document.querySelectorAll("input[type='radio'][name='brand']");
                let brand = "";
                if (brandButtons) {
                    brandButtons.forEach(button => {
                        if (button.checked) {
                            brand = button.value;
                        }
                    });
                }

                const typeButtons = document.querySelectorAll("input[type='radio'][name='product-type']");
                let productType = "";
                if (typeButtons) {
                    typeButtons.forEach(button => {
                        if (button.checked) {
                            productType = button.value;
                        }
                    });
                }

                const pageNav = document.querySelector(".change-page");
                let filterFor = "";
                let nav = "";
                let navType = "";
                let key = "";
                if (pageNav.dataset.nav) {
                    filterFor = "nav";
                    nav = pageNav.dataset.nav;
                    navType = pageNav.dataset.navType;
                }
                else if (pageNav.dataset.search) {
                    filterFor = "search";
                    key = pageNav.dataset.search;
                }

                const pageNavContainer = document.querySelector('.page-nav');
                const totalProduct = document.querySelector("input[type='hidden'][name='totalproduct']").value;
                let totalPage = 0;
                if (totalProduct % 12 == 0) {
                    totalPage = totalProduct / 12;
                }
                else {
                    totalPage = totalProduct / 12 + 1;
                }

                clearElement(pageNavContainer);

                if (!(totalPage < 2)) {
                    for (let i = 1; i <= totalPage; i++) {
                        const navButton = document.createElement("button");
                        navButton.classList.add("change-page");
                        navButton.dataset.leftRange = leftRange;
                        navButton.dataset.rightRange = rightRange;
                        navButton.dataset.skinType = skinType;
                        navButton.dataset.brand = brand;
                        navButton.dataset.productType = productType;
                        navButton.dataset.filter = filterFor;
                        navButton.dataset.nav = nav;
                        navButton.dataset.navType = navType;
                        navButton.dataset.key = key;
                        navButton.onclick = function loadFilterPage() {
                            const pageNavs = document.querySelectorAll("button.change-page");
                            pageNavs.forEach(pNav => {
                                if (pNav.classList.contains("active"));
                                pNav.classList.remove("active");
                            });
                            navButton.classList.add("active");
                            const orderProduct = document.querySelector(".order-product");
                            const xmlhttp = new XMLHttpRequest();
                            xmlhttp.onload = function () {
                                document.querySelector(".product-catalog.product-page").innerHTML = this.responseText;
                            }
                            xmlhttp.open("GET", "./model/filter_products.php?lrange=" + leftRange + "&rrange=" + rightRange + "&skintype=" + skinType + "&brand=" + brand + "&producttype=" + productType + "&filter=" + filterFor + "&order=" + orderProduct.value + "&nav=" + nav + "&navtype=" + navType + "&key=" + key + "&pageNum=" + i);
                            xmlhttp.send();
                        };
                        navButton.innerHTML = i;
                        pageNavContainer.appendChild(navButton);
                    }

                    pageNavContainer.firstChild.classList.add("active");
                }
            }

            function clearElement(element) {
                while (element.firstChild) {
                    element.removeChild(element.firstChild);
                }
            }
        </script>
    </div>
</div>