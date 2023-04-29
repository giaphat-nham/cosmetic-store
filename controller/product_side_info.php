<?php
$conn->loadBrandLogo($_GET['productId']);
?>
<div class="side-info">
    <?php
    $conn->loadProductSideInfo($_GET['productId']);
    ?>
</div>