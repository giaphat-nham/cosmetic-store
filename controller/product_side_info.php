<a href="./product.php" class="brand-logo">
    <img src="./img/brands/larocheposay-logo.jpg" alt="">
</a>
<div class="side-info">
    <?php
    $conn->loadProductSideInfo($_GET['productId']);
    ?>
</div>