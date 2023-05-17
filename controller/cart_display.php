<?php

//Nhận số lượng các mặt hàng trong giỏ hàng, sẽ được hiển thị trong tiêu đề.
//$num_items_in_cart = isset($_SESSION['cart']) ? count($_SESSION['cart']) : 0;
//<span>$num_items_in_cart</span> thêm vào sau thẻ i của icon shopping


//Nếu người dùng nhấp vào nút Thêm vào giỏ hàng trên trang sản phẩm 
if (isset($_POST['product_id']) && isset($_POST['account_id'])) {
// Đặt các biến là số nguyên    
    $product_id = (int)$_POST['product_id'];
    $account_id = (int)$_POST['account_id'];
    $quantity = 1;

    $what = "add";

    if(isset($_GET['what'])) $what = $_GET['what'];

    if ($what == "add") {
        // Câu lệnh SQL, kiểm tra xem sản phẩm có tồn tại trong dữ liệu sp không ?
  
        $sql = "SELECT * FROM product WHERE product_id = $productId";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);
// Chú ý: check user nữa

// Câu lệnh SQL, kiểm tra xem sản phẩm có tồn tại trong dữ liệu Giỏ hàng không ?
//       $sql = "SELECT * FROM cart WHERE product_id = $productId";
//       $result = mysqli_query($this->conn, $sql);
//       $row = mysqli_fetch_array($result); 

        // Check sp
        if ($row) {
        // Sản phẩm tồn tại trong cơ sở dữ liệu,  tạo/cập nhật biến cho giỏ hàng
            if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])) {
                if (array_key_exists($product_id, $_SESSION['cart'])) {
        // Sản phẩm tồn tại trong giỏ hàng vì vậy chỉ cần cập nhật quanity
                    $_SESSION['cart'][$product_id] += 1;
                } else {
                    // Sản phẩm không tồn tại trong giỏ hàng
                    $_SESSION['cart'][$product_id] = 1;
                }
            } 
            else {
        // Không có sản phẩm trong giỏ hàng, điều này sẽ thêm sản phẩm đầu tiên vào giỏ hàng
                $_SESSION['cart'] = array($product_id => $quantity);
            }
        }
            // Không resubmission
        header('location: index.php?act=cartview');
        exit;
    }

//XXXXXXXXXXXXXXXXXXXXX
// Xóa sản phẩm khỏi giỏ hàng, kiểm tra thông số URL "Xóa", đây là ID sản phẩm, đảm bảo đó là số và kiểm tra xem nó có trong giỏ hàng
    if ($what == "remove"){
        if (is_numeric($_GET['remove']) && isset($_SESSION['cart']) && isset($_SESSION['cart'][$_GET['remove']])) {
    // Loại bỏ sản phẩm khỏi giỏ hàng
        unset($_SESSION['cart'][$_GET['remove']]);
        }
        header('location: index.php?act=cartview');
    }
// chuyển trang đặt hàng nếu họ nhấp vào nút đặt hàng 
// check Giỏ không rỗng
if (isset($_POST['placeorder']) && isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
header('Location: index.php?page=placeorder');
exit;
}
   
}