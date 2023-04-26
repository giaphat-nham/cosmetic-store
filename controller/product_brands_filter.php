<div class="product-brands-filter radio-button-group">
    <label for="brand" class="label">Thương hiệu:</label>
    <?php
    if (isset($_GET['nav'])) {
        if ($_GET['nav'] != "brand") {
            $brands = $conn->getBrands();

            foreach ($brands as $brand) {
                echo "<div class='radio-option'>
        <input type='radio' name='brand' id='" . $brand['brand_name'] . "' value='" . $brand['brand_name'] . "'>
        <label for='" . $brand['brand_name'] . "'>" . $brand['display_name'] . "</label>
    </div>";
            }
        }
    } else if (isset($_GET['txtSearch'])) {
        $brands = $conn->getBrands();

        foreach ($brands as $brand) {
            echo "<div class='radio-option'>
        <input type='radio' name='brand' id='" . $brand['brand_name'] . "' value='" . $brand['brand_name'] . "'>
        <label for='" . $brand['brand_name'] . "'>" . $brand['display_name'] . "</label>
    </div>";
        }
    }
    ?>
</div>