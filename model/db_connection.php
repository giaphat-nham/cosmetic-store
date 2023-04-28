<?php
class DatabaseConnection
{
    private $host;
    private $username;
    private $password;
    private $db;
    private $conn;

    public function __construct($host, $username, $password, $db)
    {
        $this->host = $host;
        $this->username = $username;
        $this->password = $password;
        $this->db = $db;
    }

    public function connect()
    {
        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->db);
        //check connection
        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }
    public function close()
    {
        $this->conn->close();
    }

    public function getBrands()
    {
        $sql = "SELECT brand_name, display_name FROM brand";
        $result = mysqli_query($this->conn, $sql);
        $arr = array();

        while ($row = mysqli_fetch_array($result)) {
            array_push($arr, $row);
        }

        return $arr;
    }

    public function loadProductsBrand()
    {
        $brandName = $_GET['brand'];
        $sql = "SELECT brand_id FROM brand WHERE brand_name = '" . $brandName . "'";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);
        $brandId = $row['brand_id'];

        $start = 0;
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = $brandId AND product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 ORDER BY product_name ASC LIMIT $start,12";
        $result = mysqli_query($this->conn, $sql);

        while ($row = mysqli_fetch_array($result)) {
            echo "
                <a href='./index.php?act=productDetails&productId=" . $row['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $row['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($row['price'], 0, '', '.') . "</div>
                        <svg class='heart' xmlns='http://www.w3.org/2000/svg' id='Outline' viewBox='0 0 24 24' width='22'
                            height='22'>
                            <path
                                d='M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z' />
                        </svg>
                    </div>
                    <div class='product-brand'>" . $row['display_name'] . "</div>
                    <div class='product-name'>" . $row['product_name'] . "</div>
                </a>";
        }
    }

    public function getBrandDisplayName($name)
    {
        $sql = "SELECT display_name FROM brand WHERE brand_name = '$name'";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);

        return $row['display_name'];
    }

    public function getTypeDisplayName($type)
    {
        $sql = "SELECT product_type_name FROM product_type WHERE product_type_id = '$type'";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);

        return $row['product_type_name'];
    }

    public function loadProductType()
    {
        $start = 0;
        $productType = $_GET['type'];

        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product_type = $productType AND product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 ORDER BY product_name ASC LIMIT $start,12";
        $result = mysqli_query($this->conn, $sql);

        while ($row = mysqli_fetch_array($result)) {
            echo "
                <a href='./index.php?act=productDetails&productId=" . $row['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $row['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($row['price'], 0, '', '.') . "</div>
                        <svg class='heart' xmlns='http://www.w3.org/2000/svg' id='Outline' viewBox='0 0 24 24' width='22'
                            height='22'>
                            <path
                                d='M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z' />
                        </svg>
                    </div>
                    <div class='product-brand'>" . $row['display_name'] . "</div>
                    <div class='product-name'>" . $row['product_name'] . "</div>
                </a>";
        }
    }

    public function loadPageNavigation()
    {
        if (isset($_GET['brand'])) {
            $brandName = $_GET['brand'];
            $sql = "SELECT brand_id FROM brand WHERE brand_name = '" . $brandName . "'";
            $result = mysqli_query($this->conn, $sql);
            $row = mysqli_fetch_array($result);
            $brandId = $row['brand_id'];

            $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = $brandId AND product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1";
            $result = mysqli_query($this->conn, $sql);

            $totalProduct = $result->num_rows;
            $totalProduct % 12 == 0 ? $pageNumbers = $totalProduct / 12 : $pageNumbers = $totalProduct / 12 + 1;

            for ($i = 1; $i <= $pageNumbers; $i++) {
                echo "<button href='#' class='change-page' data-nav='brand' data-nav-type='$brandId' onclick='sendPageNumber(this.dataset.nav, this.dataset.navType, this.innerHTML, this)'>$i</button>";
            }
        } else if (isset($_GET['type'])) {
            $productType = $_GET['type'];
            $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product_type = $productType AND product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1";
            $result = mysqli_query($this->conn, $sql);

            $totalProduct = $result->num_rows;
            $totalProduct % 12 == 0 ? $pageNumbers = $totalProduct / 12 : $pageNumbers = $totalProduct / 12 + 1;

            for ($i = 1; $i <= $pageNumbers; $i++) {
                echo "<button href='#' class='change-page' data-nav='nBrand' data-nav-type='$productType' onclick='sendPageNumber(this.dataset.nav, this.dataset.navType, this.innerHTML, this)'>$i</button>";
            }
        } else if (isset($_GET['skintype'])) {
            $skinType = $_GET['skintype'];
            $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND skin_type = '$skinType' ORDER BY product_name ASC";
            $result = mysqli_query($this->conn, $sql);

            $totalProduct = $result->num_rows;
            $totalProduct % 12 == 0 ? $pageNumbers = $totalProduct / 12 : $pageNumbers = $totalProduct / 12 + 1;

            for ($i = 1; $i <= $pageNumbers; $i++) {
                echo "<button href='#' class='change-page' data-skin-type='$skinType' onclick='loadSkinTypePage(this.dataset.skinType,this.innerHTML,this)'>$i</button>";
            }
        }
    }

    public function loadProductMainInfo($productId)
    {
        $sql = "SELECT product" . '.' . "img, product_name, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND product_id = $productId";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);

        echo "<img class='main-img' src='./img/product/" . $row['img'] . "' alt='Ảnh sản phẩm'>
    <div class='info'>
        <div class='brand'>" . $row['display_name'] . "</div>
        <div class='name'>" . $row['product_name'] . "</div>
        <div class='price-fav'>
            <div class='price'>" . number_format($row['price'], 0, '', '.') . "</div>
            <svg xmlns='http://www.w3.org/2000/svg' id='Outline' viewBox='0 0 24 24' width='24' height='24'>
                <path
                    d='M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z' />
            </svg>
        </div>
        <div class='button-group'>
            <button class='add-to-cart' data-product-id='$productId'>Thêm vào giỏ hàng</button>
            <button class='buy-now' data-product-id='$productId'>Mua ngay</button>
        </div>
    </div>";
    }

    public function loadProductDiscription($productId)
    {
        $sql = "SELECT info FROM product WHERE product_id = $productId";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);

        echo $row['info'];
    }

    public function loadProductIngredient($productId)
    {
        $sql = "SELECT ingredient FROM product WHERE product_id = $productId";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);

        echo $row['ingredient'];
    }

    public function loadProductTags($productId)
    {
        $sql = 'SELECT skin_type, product_type_name, display_name, product_type, brand_name FROM product, product_type, brand WHERE product' . '.' . 'brand_id = brand' . '.' . "brand_id AND product_type = product_type_id AND product_id = $productId";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);

        switch ($row['skin_type']) {
            case 'dry':
                echo "<a href='./index.php?act=product&skintype=dry' class='tag'>Da khô</a>";
                break;
            case 'oil':
                echo "<a href='./index.php?act=product&skintype=oil' class='tag'>Da dầu</a>";
                break;
            case 'all':
                echo "<a href='./index.php?act=product&skintype=all' class='tag'>Mọi loại da</a>";
                break;
        }

        echo "<a href='./index.php?act=product&nav=any&type=" . $row['product_type'] . "' class='tag'>" . $row['product_type_name'] . "</a>";
        echo "<a href='./index.php?act=product&nav=brand&brand=" . $row['brand_name'] . "' class='tag'>" . $row['display_name'] . "</a>";
    }

    public function loadProductRecommendation($productId)
    {
        $sql = "SELECT brand_id FROM product WHERE product_id = $productId";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);
        $brandId = $row['brand_id'];

        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = $brandId AND product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND product_id != $productId ORDER BY product_id DESC LIMIT 0,2";
        $result = mysqli_query($this->conn, $sql);

        while ($row = mysqli_fetch_array($result)) {
            echo "
                <a href='./index.php?act=productDetails&productId=" . $row['product_id'] . "' class='product product-details-page'>
                    <img src='./img/product/" . $row['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($row['price'], 0, '', '.') . "</div>
                        <svg class='heart' xmlns='http://www.w3.org/2000/svg' id='Outline' viewBox='0 0 24 24' width='22'
                            height='22'>
                            <path
                                d='M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z' />
                        </svg>
                    </div>
                    <div class='product-brand'>" . $row['display_name'] . "</div>
                    <div class='product-name'>" . $row['product_name'] . "</div>
                </a>";
        }
    }

    public function getSearchResult($key)
    {
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND product_name LIKE '%$key%' ORDER BY product_name ASC";
        $result = mysqli_query($this->conn, $sql);
        $searchResult = array();

        while ($row = mysqli_fetch_array($result)) {
            array_push($searchResult, $row);
        }

        return $searchResult;
    }

    public function loadProductSkinType($skinType)
    {
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND skin_type = '$skinType' ORDER BY product_name ASC LIMIT 0,12";
        $result = mysqli_query($this->conn, $sql);

        while ($row = mysqli_fetch_array($result)) {
            echo "
                <a href='./index.php?act=productDetails&productId=" . $row['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $row['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($row['price'], 0, '', '.') . "</div>
                        <svg class='heart' xmlns='http://www.w3.org/2000/svg' id='Outline' viewBox='0 0 24 24' width='22'
                            height='22'>
                            <path
                                d='M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z' />
                        </svg>
                    </div>
                    <div class='product-brand'>" . $row['display_name'] . "</div>
                    <div class='product-name'>" . $row['product_name'] . "</div>
                </a>";
        }

    }

    public function loadProductSideInfo($productId)
    {
        $sql = 'SELECT skin_type, product_type_name, display_name FROM product, product_type, brand WHERE product' . '.' . 'brand_id = brand' . '.' . "brand_id AND product_type = product_type_id AND product_id = $productId";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);

        switch ($row['skin_type']) {
            case "oil":
                $skinType = "Da dầu";
                break;
            case "dry":
                $skinType = "Da khô";
                break;
            default:
                $skinType = "Mọi loại da";
                break;
        }

        echo "<div class='info-row'>
        <div class='info-label'>Thương hiệu</div>
        <div class='info-detail' id='lbl-brand'>" . $row['display_name'] . "</div>
    </div>
    <div class='info-row'>
        <div class='info-label'>Loại da phù hợp</div>
        <div class='info-detail' id='lbl-skin'>$skinType</div>
    </div>
    <div class='info-row'>
        <div class='info-label'>Loại sản phẩm</div>
        <div class='info-detail' id='lbl-type'>".$row['product_type_name']."</div>
    </div>";
    }

}
?>