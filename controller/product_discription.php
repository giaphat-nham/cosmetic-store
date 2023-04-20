<div class="product-discription">
    <div class="title">Mô tả sản phẩm</div>
    <div class="discription">
        <?php 
            $conn->loadProductDiscription($_GET['productId']);
        ?>
    </div>
    <div class="title">Thành phần sản phẩm</div>
    <div class="ingredient"><?php
        $conn->loadProductIngredient($_GET['productId']);
    ?></div>
    <div class="title">Hướng dẫn bảo quản</div>
    <ul class="preservation">
        <li>Tránh ánh nắng trực tiếp.</li>
        <li>Để nơi khô ráo, thoáng mát.</li>
        <li>Đậy nắp kín sau khi sử dụng.</li>
    </ul>
</div>
<div class="product-tags">
    <div class="title">Nhãn sản phẩm</div>
    <div class="tags">
        <?php
        $conn->loadProductTags($_GET['productId']);
        ?>
    </div>
</div>