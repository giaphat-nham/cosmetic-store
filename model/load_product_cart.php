<?php
$conn = mysqli_connect("localhost", "root", "", "cosmetic_store");

    if(isset($_GET["what"]) && $_GET["what"]=="remove"){
        $productId = $_GET['productId'];
        $accountId = $_SESSION['account_id'];
        $sql = "DELETE FROM cart  WHERE product_id = $productId AND account_id = $accountId";
        $conn->query($sql);
    
    }


    // cập nhật số lượng sp trong giỏ hàng

    if(isset($_GET['submit'])){ 
        $accountId = $_SESSION['account_id'];
			//if( !is_numeric($val)) { 
        //echo "<scripttype='text/javascript'>alert('Vui lòng nhập số lượng là số .');</script>";
        //echo "<script>window.location='index.php?act=cart'</script>"; 
        
        if(isset($_POST[$product_id])){
        $sql = "UPDATE cart SET quantity =  $quantity_num WHERE product_id = $product_id AND account_id = $accountId";      
        $conn->query($sql);
        }
		}
        
function checkProductCart($accountId) {
    $sql = "SELECT * from cart WHERE account_id = $accountId";
    $result = mysqli_query($GLOBALS['conn'], $sql);
    return $result->num_rows;
}

    if (checkProductCart($_SESSION['account_id']) <= 0) {
        echo "
            <div style='text-align:center';>
                <h1 style='display: inline-block'>Bạn chưa có sản phẩm nào trong giỏ hàng</h1>
            </div>";
    }
    else {
        echo"
            <div class='cart-body' >
            <form action='index.php?act=cart' method='post' >
            <table class='tb_cart' cellpadding='0' cellspacing='0' >
                <tr class='tb_head'>
                    <th>Tên sản phẩm</th> 
                    <th>Số lượng</th> 
                    <th>Giá</th> 
                    <th>Thành tiền</th>
                    <th>Xóa</th>
                </tr>";
        $accountId = $_SESSION['account_id'];
        $sql = "SELECT account_id, cart" . '.' . "product_id, product_name, price, cart" . '.' . "quantity AS cart_quantity, product" . '.' . "quantity AS product_quantity FROM product, cart WHERE product" . '.' . "product_id = cart" . '.' . "product_id AND state = 1 and account_id = $accountId";
        $result = mysqli_query($GLOBALS['conn'], $sql);
        $total = 0;
        $subtotal= 0;
        while ($row = mysqli_fetch_array($result)) {
        echo" 
            <tr>
                <td class='product-name'>" .$row['product_name']. "</td>
                <td class='quantity'>
                <div class='input-group'>
                    <span class='btn-danger' onclick='this.parentNode.querySelector('input[type=number]').stepDown()'></span>
                    <input type='hidden' name='".$row['product_id']."'>
                    <input style='width: 90px;' name='quantity_num' type='number' value='" .$row['cart_quantity']. "' class='update' min='1' max='" .$row['product_quantity']. "'>
                    <span class='btn-success' onclick='this.parentNode.querySelector('input[type=number]').stepUp()'></span>
                </div>
                </td>
                <td class='product-price'>" . number_format($row['price'], 0, '', '.') . "&#8363;</td>
                <!-- price-sub = price* quantity -->
                <td class='price-sub'>". number_format($row['price' ]*$row['cart_quantity'], 0, '', '.') . "&#8363;</td>
                <td class='remove-sub'><a class='remove' style='text-decoration: none; color: #517d48' href='index.php?act=cart&what=remove&productId=" .$row['product_id']. " '>Xóa</a></td> 
            </tr> ";
            $subtotal = number_format( $total += $row['price' ]*$row['cart_quantity'], 0, '', '.'); }
        echo " 
            </table>
            <div class='total' '>
                    <span class='text' >Tổng tiền: </span>
                    <span class='subtotal' >" .$subtotal. "&#8363; </span>
            </div>
            <div class='btn_button'>
                <div class='button' style='margin-right: 17px'>
                    <a href='./index.php?act=cart&submit'>Cập nhật</a>
                </div>
                <div class='button'>
                <a href='./index.php?act=placeorder'>Thanh toán</a>
                </div>
            </div>
    </form>
    
  </div>";
    }
    

?>