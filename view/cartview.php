<?php
if (!isset($_SESSION['account_id'])) {
    echo "<script>window.location='index.php?unLogedin'</script>";
}
?>

<link rel="stylesheet" href="./css/cart.css">
<div class="card-main">
  <div class="card-header">
    GIỎ HÀNG CỦA BẠN
  </div>
  <div>
    <?php include("./model/load_product_cart.php") ?>
  </div>
<!--   <div class="cart-body">
    <form action="index.php?act=cartview" method="post">
      <table class="tb_cart" cellpadding="0" cellspacing="0">
        <tr class="tb_head">
              <th>Tên sản phẩm</th> 
              <th>Số lượng</th> 
              <th>Giá</th> 
              <th>Thành tiền</th>
              <th>Xóa</th>
        </tr>
        <tr>
            
        </tr> -->
<!--        <tr>
          <td class="product-name"></td>
          <td class="quantity">
            <div class="input-group">
                <span class="btn-danger" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></span>
                <input type="number" value="" class="update" min="1" max="100">
                <span class="btn-success" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"></span>
            </div>
          </td>
          <td class="product-price"></td>
         
          <td class="price-sub"></td>
          <td class="remove"><a href="index.php?act=cart&what=remove&id=">Xóa</a></td>
        </tr> 
        <tr class="total">
              <span class="text">Tổng tiền:</span>
              <span class="subtotal" ></span>
        </tr> 
      </table>
          <div class="button">
              <input type="submit" value="Cập nhật" name="update">
          </div>
          <div class="button">
              <input type="submit" value="Thanh toán" name="placeorder">
          </div>
    </form>
    
  </div>-->

  <div class="card-footer text-body-secondary">
    <a href="http://localhost/cosmetic-store/index.php" style="color:black"> << Tiếp tục mua sắm</a>
  
  </div>
 
</div>