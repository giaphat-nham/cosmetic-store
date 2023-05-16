<?php $resultBrand = $conn->loadProductBrand() ?>
<?php $resultTypeID = $conn->admin_LoadProductType() ?>
<?php $rowMaxID = $conn->initProductID();
$currentID = $rowMaxID['maxID'] + 1; ?>

<form action="" method="post" enctype="multipart/form-data">
    <h2>Thêm sản phẩm</h2>
    <div class="product-id form-item">
        <label for="product_id" class="font-weight-bold">Mã sản phẩm:</label>
        <input type="text" name="product_id" value="<?php echo ($currentID) ?>" disabled>
    </div>

    <div class="product-name form-item "><label for="product_name" class="require font-weight-bold">Tên sản
            phẩm:</label>
        <input type="text" name="product_name">
    </div>

    <div class="product-brand form-item">
        <label for="product_brand" class="font-weight-bold">Thương hiệu:</label>
        <select name="product_brand" id="product_brand">
            <?php
            while ($row = mysqli_fetch_array($resultBrand)) {
                echo ("<option value='" . $row['brand_id'] . "' >" . $row['brand_name'] . "</option>");
            }
            ?>
        </select>
    </div>

    <div class="product-type form-item">
        <label for="product_type" class="font-weight-bold">Loại sản phẩm:</label>
        <select name="product_type" id="product_type">
            <?php
            while ($row = mysqli_fetch_array($resultTypeID)) {
                echo ("<option value='" . $row['product_type_id'] . "' >" . $row['product_type_name'] . "</option>");
            }
            ?>
        </select>
    </div>


    <div class="product-info form-item wide-height">
        <label for="product_info" class="require font-weight-bold">Mô tả:</label>
        <input type="text" name="product_info">
    </div>

    <div class="product-ingredient form-item wide-height">
        <label for="product_ingredient" class="font-weight-bold">Thành phần:</label>
        <input type="text" name="product_ingredient">
    </div>

    <div class="product-skin-type form-item">
        <label for="product_skinType" class="font-weight-bold">Loại da:</label>
        <select name="product_skinType" id="product_skinType">
            <option name="product_skinType" value="all" selected>Mọi loại da</option>
            <option name="product_skinType" value="dry">Da khô</option>
            <option name="product_skinType" value="normal">Da thường</option>
            <option name="product_skinType" value="oil">Da dầu</option>
        </select>
    </div>


    <div class="product-volume form-item">
        <label for="product_volume" class="require font-weight-bold">Thể tích(ml):</label>
        <input type="text" name="product_volume">
    </div>

    <div class="product-price form-item">
        <label for="product_price" class="require font-weight-bold">Giá:</label>
        <input type="number" step="1000" min="1000" name="product_price">
    </div>

    <div class="product-quantity form-item">
        <label for="product_quantity" class="require font-weight-bold">Số lượng:</label>
        <input type="number" name="product_quantity">
    </div>

    <div class="product-img form-item">
        <label for="product_image" class="require font-weight-bold">Hình ảnh:</label>
        <input type="file" name="product_image" id="product_image">
    </div>
    <div class="button form-item">
        <button name="btnSave" class="btnSave font-weight-bold btn-item">Lưu</button>
    </div>


</form>

<?php
if (isset($_POST['btnSave'])) {
    $product_id = $currentID;
    $product_name = $_POST['product_name'];
    $product_brand = $_POST['product_brand'];
    $product_type = $_POST['product_type'];
    $product_info = $_POST['product_info'];
    $product_ingredient = $_POST['product_ingredient'];
    $product_skinType = $_POST['product_skinType'];
    $product_volume = $_POST['product_volume'];
    $product_price = $_POST['product_price'];
    $product_quantity = $_POST['product_quantity'];
    $imgName = $_FILES['product_image']['name'];

    $target_dir = "./img/product/";
    $target_file = $target_dir . basename($_FILES["product_image"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));


    $errors = [];

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

    // Check if image file is a actual image or fake image
    if (isset($_POST["btnSave"])) {
        $check = getimagesize($_FILES["product_image"]["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            echo "File không phải là hình ảnh." . "</br>";
            $uploadOk = 0;
        }
    }

    // Check if file already exists
    if (file_exists($target_file)) {
        echo "File đã tồn tại" . "</br>";
        $uploadOk = 0;
    }


    // Allow certain file formats
    if (
        $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif"
    ) {
        echo ("Chỉ chấp nhận file JPG, JPEG, PNG & GIF" . "</br>");
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "File của bạn không được tải lên." . "</br>";
        return;
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["product_image"]["tmp_name"], $target_file)) {
            echo "File " . htmlspecialchars(basename($_FILES["product_image"]["name"])) . " đã được tải lên.";
        } else {
            echo "Đã xảy ra lỗi khi tải tệp của bạn lên" . "</br>";
            return;
        }
    }

    if (!empty($errors)) {
        foreach ($errors as $errorField) {
            foreach ($errorField as $error) {
                echo $error['msg'] . '<br/>';
            }
        }
        return;
    }

    $conn->insertProduct($product_id, $product_brand, $product_type, $product_name, $imgName, $product_info, $product_ingredient, $product_skinType, $product_volume, $product_price, $product_quantity);



}
?>