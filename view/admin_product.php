<div class="product-page">

    <?php
    if (isset($_GET['act'])) {
        switch ($_GET['act']) {
            case "update":
                include("./view/admin_product_update.php");
                break;
            case "add":
                include("./view/admin_product_adding.php");
                break;
            case "info":
                include("./view/admin_product_info.php");
                break;
            default:
                include("./controller/product_management.php");
        }
    } else
        include("./controller/product_management.php");
    ?>


</div>