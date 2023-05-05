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