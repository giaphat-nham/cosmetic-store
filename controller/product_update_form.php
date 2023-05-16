<?php $rowProduct = $conn->loadProductByID($_GET['productID']);
$curID = $rowProduct['product_id']; ?>
<?php $resultBrand = $conn->loadProductBrand() ?>
<?php $resultTypeID = $conn->admin_LoadProductType() ?>
<?php $resultSkinType = $conn->loadSkinType() ?>


<form class="product-update-form" action="" method="post" enctype="multipart/form-data">
    <h2>Cập nhật sản phẩm</h2>

    <label for="product_id" class="font-weight-bold">Mã sản phẩm:</label>
    <input type="text" value="<?php echo ("$rowProduct[product_id]") ?>" name="product_id" disabled>

    <label for="product_name" class="require font-weight-bold">Tên sản phẩm:</label>
    <input type="text" name="product_name" value="<?php echo ("$rowProduct[product_name]") ?>">

    <label for="product_brand" class="font-weight-bold">Thương hiệu:</label>
    <select name="product_brand" id="product_brand">
        <?php
        while ($row = mysqli_fetch_array($resultBrand)) {
            if ($row['brand_id'] == $rowProduct['brand_id']) {
                echo ("<option value='" . $row['brand_id'] . "' selected >" . $row['brand_name'] . "</option>");
            }
            echo ("<option value='" . $row['brand_id'] . "' >" . $row['brand_name'] . "</option>");
        }
        ?>
    </select>

    <label for="product_type" class="font-weight-bold">Loại sản phẩm:</label>
    <select name="product_type" id="product_type">
        <?php
        while ($row = mysqli_fetch_array($resultTypeID)) {
            if ($row['product_type_id'] == $rowProduct['product_type']) {
                echo ("<option value='" . $row['product_type_id'] . "' selected >" . $row['product_type_name'] . "</option>");
            }
            echo ("<option value='" . $row['product_type_id'] . "' >" . $row['product_type_name'] . "</option>");
        }
        ?>
    </select>

    <label for="product_info" class="require font-weight-bold">Mô tả:</label>
    <input type="text" name="product_info" value="<?php echo ("$rowProduct[info]") ?>">

    <label for="product_ingredient" class="font-weight-bold">Thành phần:</label>
    <input type="text" name="product_ingredient" value="<?php echo ("$rowProduct[ingredient]") ?>">

    <label for="product_skinType" class="font-weight-bold">Loại da:</label>
    <select name="product_skinType" id="product_skinType">
        <?php
        while ($row = mysqli_fetch_array($resultSkinType)) {
            if ($row['skin_type_id'] == $rowProduct['skin_type']) {
                echo ("<option value='" . $row['skin_type_id'] . "' selected name = 'product_skinType'>" . $row['skin_type_name'] . "</option>");
            }
            echo ("<option value='" . $row['skin_type_id'] . "' name ='product_skinType'>" . $row['skin_type_name'] . "</option>");
        }
        ?>
    </select>



    <label for="product_volume" class="require font-weight-bold">Thể tích(ml):</label>
    <input type="text" name="product_volume" value="<?php echo ("$rowProduct[volume]") ?>">

    <label for="product_price" class="require font-weight-bold">Giá:</label>
    <input type="number" step="1000" min="1000" name="product_price" value="<?php echo ("$rowProduct[price]") ?>">


    <label for="product_quantity" class="require font-weight-bold">Số lượng:</label>
    <input type="number" name="product_quantity" value="<?php echo ("$rowProduct[quantity]") ?>">

    <div class="button"><button name="btnUpdate" class="btn-item font-weight-bold">Lưu</button></div>


</form>

<?php
if (isset($_POST['btnUpdate'])) {
    $product_id = $curID;
    $product_name = $_POST['product_name'];
    $product_brand = $_POST['product_brand'];
    $product_type = $_POST['product_type'];
    $product_info = $_POST['product_info'];
    $product_ingredient = $_POST['product_ingredient'];
    $product_skinType = $_POST['product_skinType'];
    $product_volume = $_POST['product_volume'];
    $product_price = $_POST['product_price'];
    $product_quantity = $_POST['product_quantity'];


    $errors = [];

    //Tên sp không được rỗng
    if (empty($product_name)) {
        $errors['product_name'][] = [

            'rule' => 'required',
            'rule_value' => true,
            'value' => $product_name,
            'msg' => 'Vui lòng nhập tên sản phẩm'
        ];
    }

    // maxlength 100 (tối đa 100 ký tự)
    if (!empty($product_name) && strlen($product_name) > 255) {
        $errors['product_name'][] = [
            'rule' => 'maxlength',
            'rule_value' => 100,
            'value' => $product_name,
            'msg' => 'Tên sản phẩm không được vượt quá 100 ký tự'
        ];
    }

    if (empty($product_info)) {
        $errors['product_info'][] = [

            'rule' => 'required',
            'rule_value' => true,
            'value' => $product_info,
            'msg' => 'Vui lòng nhập mô tả '
        ];
    }

    if (!empty($product_info) && strlen($product_info) > 2000) {
        $errors['product_info'][] = [
            'rule' => 'maxlength',
            'rule_value' => 2000,
            'value' => $product_info,
            'msg' => 'Mô tả sản phẩm không được vượt quá 2000 ký tự'
        ];
    }

    if (empty($product_volume)) {
        $errors['product_volume'][] = [

            'rule' => 'required',
            'rule_value' => true,
            'value' => $product_volume,
            'msg' => 'Vui lòng nhập thể tích'
        ];
    }

    if (empty($product_price)) {
        $errors['product_price'][] = [

            'rule' => 'required',
            'rule_value' => true,
            'value' => $product_price,
            'msg' => 'Vui lòng nhập giá'
        ];
    }

    if (empty($product_quantity)) {
        $errors['product_quantity'][] = [

            'rule' => 'required',
            'rule_value' => true,
            'value' => $product_quantity,
            'msg' => 'Vui lòng nhập số lượng'
        ];
    }


    if (!empty($errors)) {
        foreach ($errors as $errorField) {
            foreach ($errorField as $error) {
                echo $error['msg'] . '<br/>';
            }
        }
        return;
    }
    if ($conn->updateProduct($product_id, $product_brand, $product_type, $product_name, $product_info, $product_ingredient, $product_skinType, $product_volume, $product_price, $product_quantity)) {
        echo ("Cập nhật sản phẩm thành công!");

    }




}
?>