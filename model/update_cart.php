<?php
$productId = $_REQUEST['productId'];
$accountId = $_REQUEST['accountId'];

$conn = mysqli_connect("localhost", "root", "", "cosmetic_store");

if (productExisted($productId, $accountId)) {
    $sql = "UPDATE cart SET quantity = quantity + 1 WHERE product_id = $productId AND account_id = $accountId";
    $conn->query($sql);
}
else {
    $sql = "INSERT INTO cart (account_id,product_id,quantity) VALUES ($accountId,$productId,1)";
    $conn->query($sql);
}

$cartQuantity = getCartTotalProduct($accountId);

echo $cartQuantity;


function productExisted($productId, $accountId)
{
    $sql = "SELECT * FROM cart WHERE account_id = $accountId AND product_id = $productId";
    $result = mysqli_query($GLOBALS['conn'], $sql);

    return $result->num_rows > 0;
}

function getCartTotalProduct($accountId) {
    $sql = "SELECT COUNT(account_id) from cart WHERE account_id = $accountId";
    $result = mysqli_query($GLOBALS['conn'], $sql);
    $row = mysqli_fetch_array($result);

    return $row['COUNT(account_id)'];
}
?>