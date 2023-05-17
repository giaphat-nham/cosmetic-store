<?php $numberOfProducts = $conn->numberOfProducts() ?>
<?php $totalSales = $conn->totalSales() ?>
<?php $countProcessingOrder = $conn->countProcessingOrder() ?>
<?php $countProcessedOrder = $conn->countProcessedOrder() ?>

<div class="card">
    <div class="card-inner">
        <p class="text-primary">SẢN PHẨM</p>
        <span class="material-icons-outlined">inventory_2</span>
    </div>
    <span class="text-primary font-weight-bold">
        <?php echo $numberOfProducts ?>
    </span>
</div>

<div class="card">
    <div class="card-inner">
        <p class="text-primary">ĐƠN HÀNG ĐANG XỬ LÝ</p>
        <span class="material-icons-outlined">shopping_cart</span>
    </div>
    <span class="text-primary font-weight-bold">
        <?php echo $countProcessingOrder; ?>
    </span>
</div>

<div class="card">
    <div class="card-inner">
        <p class="text-primary">ĐƠN HÀNG ĐÃ HOÀN THÀNH</p>
        <span class="material-icons-outlined">add_shopping_cart</span>
    </div>
    <span class="text-primary font-weight-bold">
        <?php echo $countProcessedOrder; ?>
    </span>
</div>
<div class="card">
    <div class="card-inner">
        <p class="text-primary">DOANH SỐ</p>
        <span class="material-icons-outlined">paid</span>
    </div>
    <span class="text-primary font-weight-bold">
        <?php echo $totalSales ?>
    </span>
</div>