<?php
$conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
$pageNum = $_REQUEST['pageNum'];
$skinType = $_REQUEST['skintype'];
$orderType = $_REQUEST['order'];

$start = ($pageNum - 1) * 12;
switch ($orderType) {
    case "1":
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND skin_type = '$skinType' ORDER BY product_name ASC LIMIT $start,12 ";
        break;
    case "2":
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND skin_type = '$skinType' ORDER BY product_name DESC LIMIT $start,12 ";
        break;
    case "3":
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND skin_type = '$skinType' ORDER BY price ASC LIMIT $start,12 ";
        break;
    case "4":
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND skin_type = '$skinType' ORDER BY price DESC LIMIT $start,12 ";
        break;
}
$result = mysqli_query($conn, $sql);
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
?>