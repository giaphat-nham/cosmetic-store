<?php
$pageNum = $_REQUEST['pageNum'];
$key = $_REQUEST['txtSearch'];
$conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
$sql = "SELECT product_id, product_name, product" . '.' . "img, price, display_name FROM product, brand WHERE product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 AND product_name LIKE '%$key%' ORDER BY product_name ASC";
$result = mysqli_query($conn, $sql);
$searchResult = array();

while ($row = mysqli_fetch_array($result)) {
    array_push($searchResult, $row);
}
$start = ($pageNum-1)*12;

for ($i=$start;$i<$start+12&&$i<sizeof($searchResult);$i++) {
    echo "
                <a href='./index.php?act=productDetails&productId=" . $searchResult[$i]['product_id'] . "' class='product product-page'>
                    <img src='./img/product/" . $searchResult[$i]['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($searchResult[$i]['price'], 0, '', '.') . "</div>
                        <svg class='heart' xmlns='http://www.w3.org/2000/svg' id='Outline' viewBox='0 0 24 24' width='22'
                            height='22'>
                            <path
                                d='M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z' />
                        </svg>
                    </div>
                    <div class='product-brand'>" . $searchResult[$i]['display_name'] . "</div>
                    <div class='product-name'>" . $searchResult[$i]['product_name'] . "</div>
                </a>";
}

?>