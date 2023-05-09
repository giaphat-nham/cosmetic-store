<?php
$pageNum = $_REQUEST['pageNum'];
$key = $_REQUEST['txtSearch'];
$conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
$orderType = $_REQUEST['order'];
switch ($orderType) {
    case "1":
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND product_name LIKE '%$key%' ORDER BY product_name ASC";
        break;
    case "2":
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND product_name LIKE '%$key%' ORDER BY product_name DESC";
        break;
    case "3":
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND product_name LIKE '%$key%' ORDER BY price ASC";
        break;
    case "4":
        $sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND product_name LIKE '%$key%' ORDER BY price DESC";
        break;
}

$result = mysqli_query($conn, $sql);
$searchResult = array();

while ($row = mysqli_fetch_array($result)) {
    array_push($searchResult, $row);
}
$start = ($pageNum - 1) * 12;

for ($i = $start; $i < $start + 12 && $i < sizeof($searchResult); $i++) {
    echo "
                <a href='./index.php?act=productDetails&productId=" . $searchResult[$i]['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $searchResult[$i]['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($searchResult[$i]['price'], 0, '', '.') . "&#8363;</div>
                    </div>
                    <div class='product-brand'>" . $searchResult[$i]['display_name'] . "</div>
                    <div class='product-name'>" . $searchResult[$i]['product_name'] . "</div>
                </a>";
}

?>