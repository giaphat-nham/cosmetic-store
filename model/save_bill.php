<?php 
$conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
//bill_id	price	customer_id	bill_state	date	
//bill_id	product_id	quantity	product_price	(bill detail)
if(!empty($_POST))  {
    $date_bill = date("d-m-Y H:i:s");
    $accountId = $_SESSION['account_id'];
    $sql = "SELECT account_id, cart" . '.' . "product_id, product_name, price, cart" . '.' . "quantity AS cart_quantity, product" . '.' . "quantity AS product_quantity FROM product, cart WHERE product" . '.' . "product_id = cart" . '.' . "product_id AND state = 1 and account_id = $accountId";
    $result = mysqli_query($GLOBALS['conn'], $sql);
    $total = 0;
    $subtotal= 0;
    while ($row = mysqli_fetch_array($result)){
        $subtotal = number_format( $total += $row['price' ]*$row['cart_quantity'], 0, '', '');
    }

    $sql = "INSERT INTO bill (price, customer_id, bill_state, date) values ('$subtotal', '$accountId', '1' ,'$date_bill')";
    $conn->query($sql);

    $sql = "SELECT * from bill where date = '$date_bill'";
    $result = mysqli_query($GLOBALS['conn'], $sql);
    $row = mysqli_fetch_array($result);
    $bill_id = $row['bill_id'];
    
    $sql = "SELECT account_id, cart" . '.' . "product_id, product_name, price, cart" . '.' . "quantity AS cart_quantity, product" . '.' . "quantity AS product_quantity FROM product, cart WHERE product" . '.' . "product_id = cart" . '.' . "product_id AND state = 1 and account_id = $accountId";
    $result = mysqli_query($GLOBALS['conn'], $sql);
    while ($row = mysqli_fetch_array($result)) {
        $product_id	= $row['product_id'];
        $quantity	=  $row['cart_quantity'];
        $product_price = $row['price'];
        $sql = "INSERT into bill_detail(bill_id, product_id, quantity, product_price) values ($bill_id, $product_id, $quantity, $product_price)";
        $conn->query($sql);
        $sql = "UPDATE product set  quantity = quantity - $quantity WHERE product_id = $productId AND account_id = $accountId";
    }

    $sql ="DELETE from cart where accout_id = $accountId";
    $conn->query($sql);
}
?>