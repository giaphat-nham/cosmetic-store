<div class="main-info">
    <?php
    $conn->loadProductMainInfo($_GET['productId']);
    ?>
    <script type='text/javascript'>
        function addToCart(productId, accountId) {
            if (accountId == "") {
                loginform();
            }
            else {
                const xmlhttp = new XMLHttpRequest();
                xmlhttp.onload = function() {
                    const basket =document.querySelector("#btn-basket");
                    basket.dataset.totalProduct = this.responseText;
                    alert("Thêm sản phẩm thành công vào giỏ hàng!");
                };
                xmlhttp.open("GET","./model/update_cart.php?productId="+productId+"&accountId="+accountId);
                xmlhttp.send();
            }
        }
    </script>
</div>