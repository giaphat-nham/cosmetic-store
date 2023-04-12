<div class="catalog-nav">
    <?php
    if (isset($_GET['nav'])) {
        switch ($_GET['nav']) {
            case "brand":
                $brands = $conn->getBrands();
                echo "<a href='product.php?nav=brand'>Thương hiệu</a>";
                echo "<ul>";
                foreach ($brands as $brand) {
                        echo "<li><a href='product.php?nav=brand&brand=".$brand['brand_name']."'>".$brand['display_name']."</a></li>";
                }
                echo "</ul>";
                break;
            case "facecare":
                echo "<a href='product.php?nav=facecare'>Chăm sóc da mặt</a>";
                echo "<ul>";
                echo "<li><a href='./product.php?nav=facecare&type=micellar'>Tẩy trang</a></li>
                        <li><a href='./product.php?nav=facecare&type=cleanser'>Sữa rửa mặt</a></li>
                        <li><a href='./product.php?nav=facecare&type=toner'>Toner</a></li>
                        <li><a href='./product.php?nav=facecare&type=serum'>Serum</a></li>
                        <li><a href='./product.php?nav=facecare&type=moisturizer'>Dưỡng ẩm</a></li>
                        <li><a href='./product.php?nav=facecare&type=suncream'>Kem chống nắng</a></li>";
                echo "</ul>";
                break;
            case "bodycare":
                echo "<a href='product.php?nav=bodycare'>Chăm sóc cơ thể</a>";
                echo "<ul>";
                echo "<li><a href='./product.php?nav=bodycare&type=srub'>Tẩy tế bào chết</a></li>
                        <li><a href='./product.php?nav=bodycare&type=bodycleanser'>Sữa tắm</a></li>
                        <li><a href='./product.php?nav=bodycare&type=lotion'>Dưỡng thể</a></li>";
                echo "</ul>";
                break;
            case "makeup":
                echo "<a href='product.php?nav=makeup'>Makeup</a>";
                echo "<ul>";
                echo "<li><a href='./product.php?nav=makeup&type=primer'>Kem lót</a></li>
                        <li><a href='./product.php?nav=makeup&type=foundation'>Kem nền</a></li>
                        <li><a href='./product.php?nav=makeup&type=concealer'>Che khuyết điểm</a></li>
                        <li><a href='./product.php?nav=makeup&type=powder'>Phấn phủ</a></li>
                        <li><a href='./product.php?nav=makeup&type=mascara'>Mascara</a></li>
                        <li><a href='./product.php?nav=makeup&type=eyeliner'>Kẻ mắt</a></li>
                        <li><a href='./product.php?nav=makeup&type=lipstick'>Son</a></li>";
                echo "</ul>";
                break;
        }
    }
    ?>
</div>