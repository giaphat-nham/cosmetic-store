<?php
$lRange = $_REQUEST['lrange'];
$rRange = $_REQUEST['rrange'];
$skinType = $_REQUEST['skintype'];
$brand = $_REQUEST['brand'];
$productType = $_REQUEST['producttype'];
$filterFor = $_REQUEST['filter'];
$orderType = $_REQUEST['order'];
$nav = $_REQUEST['nav'];
$navType = $_REQUEST['navtype'];
$key = $_REQUEST['key'];
$pageNum = $_REQUEST['pageNum'];
$orderBy = "";
$sqlBrand = "";
$sqlSkinType = "";
$sqlProductType = "";
$totalProduct = 0;
$conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
switch ($orderType) {
    case "1":
        $orderBy = "product_name ASC";
        break;
    case "2":
        $orderBy = "product_name DESC";
        break;
    case "3":
        $orderBy = "price ASC";
        break;
    case "4":
        $orderBy = "price DESC";
        break;
}

if ($brand != "") {
    $sqlBrand = "AND brand_name = '$brand' ";
}
if ($skinType != "") {
    $sqlSkinType = "AND skin_type = '$skinType' ";
}
if ($productType != "") {
    $sqlProductType = "AND category" . '.' . "category_id = $productType ";
}

$start = ($pageNum-1)*12;

if ($filterFor == "nav") {
    if ($nav == "brand") {
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name, brand_name, skin_type, product_type_id FROM product, brand, category, product_type WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND product_type" . '.' . "category_id = category" . '.' . "category_id AND product" . '.' . "product_type = product_type" . '.' . "product_type_id AND product" . '.' . "brand_id = $navType AND price BETWEEN $lRange AND $rRange $sqlBrand $sqlProductType $sqlSkinType ORDER BY $orderBy LIMIT $start,12";
        $sql1 = "SELECT product_id, product_name, product" . '.' . "img, price, display_name, brand_name, skin_type, product_type_id FROM product, brand, category, product_type WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND product_type" . '.' . "category_id = category" . '.' . "category_id AND product" . '.' . "product_type = product_type" . '.' . "product_type_id AND product" . '.' . "brand_id = $navType AND price BETWEEN $lRange AND $rRange $sqlBrand $sqlProductType $sqlSkinType ORDER BY $orderBy";
    } else {
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name, brand_name, skin_type, product_type_id FROM product, brand, category, product_type WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND product_type" . '.' . "category_id = category" . '.' . "category_id AND product" . '.' . "product_type = product_type" . '.' . "product_type_id AND product" . '.' . "product_type = $navType AND price BETWEEN $lRange AND $rRange $sqlBrand $sqlProductType $sqlSkinType ORDER BY $orderBy LIMIT $start,12";
        $sql1 = "SELECT product_id, product_name, product" . '.' . "img, price, display_name, brand_name, skin_type, product_type_id FROM product, brand, category, product_type WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND product_type" . '.' . "category_id = category" . '.' . "category_id AND product" . '.' . "product_type = product_type" . '.' . "product_type_id AND product" . '.' . "product_type = $navType AND price BETWEEN $lRange AND $rRange $sqlBrand $sqlProductType $sqlSkinType ORDER BY $orderBy";
    }

    $result = mysqli_query($conn, $sql);
    $result1 = mysqli_query($conn, $sql1);

    while ($row = mysqli_fetch_array($result)) {
        echo "
                <a href='./index.php?act=productDetails&productId=" . $row['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $row['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($row['price'], 0, '', '.') . "&#8363;</div>
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
    if ($result->num_rows <= 0) {
        echo "<h3>Không có kết quả!</h3>";
    }
    else {
        $totalProduct = $result1->num_rows;
    }
} else if ($filterFor = "search") {

    $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name, brand_name, skin_type, product_type_id FROM product, brand, category, product_type WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND product_type" . '.' . "category_id = category" . '.' . "category_id AND product" . '.' . "product_type = product_type" . '.' . "product_type_id AND product_name LIKE '%$key%' AND price BETWEEN $lRange AND $rRange $sqlBrand $sqlProductType $sqlSkinType ORDER BY $orderBy LIMIT $start,12";
    $sql1 = "SELECT product_id, product_name, product" . '.' . "img, price, display_name, brand_name, skin_type, product_type_id FROM product, brand, category, product_type WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND product_type" . '.' . "category_id = category" . '.' . "category_id AND product" . '.' . "product_type = product_type" . '.' . "product_type_id AND product_name LIKE '%$key%' AND price BETWEEN $lRange AND $rRange $sqlBrand $sqlProductType $sqlSkinType ORDER BY $orderBy";
    $result = mysqli_query($conn, $sql);
    $result1 = mysqli_query($conn, $sql1);

    while ($row = mysqli_fetch_array($result)) {
        echo "
                <a href='./index.php?act=productDetails&productId=" . $row['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $row['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($row['price'], 0, '', '.') . "&#8363;</div>
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
    if ($result->num_rows <= 0) {
        echo "<h3>Không có kết quả!</h3>";
    } else {
        $totalProduct = $result1->num_rows;
    }
}

echo "<input type='hidden' name='lrange' value='$lRange'>";
echo "<input type='hidden' name='rrange' value='$rRange'>";
echo "<input type='hidden' name='skintype' value='$skinType'>";
echo "<input type='hidden' name='brand' value='$brand'>";
echo "<input type='hidden' name='producttype' value='$productType'>";
echo "<input type='hidden' name='filter' value='$filterFor'>";
echo "<input type='hidden' name='key' value='$key'>";
echo "<input type='hidden' name='totalproduct' value='$totalProduct'>";
?>