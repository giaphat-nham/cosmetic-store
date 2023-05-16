<div class="delete-msg-container">
    <?php
    if (isset($_GET['act'])) {
        $msg = "Bạn có chắc muốn xóa sản phẩm nầy chứ?";
        if ($_GET['act'] = "delete") {
            echo "<form class='delete-confirm-form' method='post' action=''>" . "<div class='msg'>"
                . $msg . "</div>" . "<div class='confirm'>" . "<input type='submit' value='Xóa' name='confirm' >
        <input type='submit' value='Hủy' name='confirm'> </div>
        </form>";

            if (isset($_POST['confirm'])) {
                if ($_POST['confirm'] == 'Xóa') {
                    $conn->deleteProduct($_GET['productID']);
                    echo 'Xóa sản phẩm thành công!';
                    header('Location: ./admin.php?fname=product&feature=2');
                } else if ($_POST['confirm'] == 'Hủy') {
                    header('Location:./admin.php?fname=product&feature=2');
                }
            }
        } else
            header('Location: ./admin.php?fname=product&feature=2');

    }
    ?>
</div>
<div class="product-table">
    <div class="button-add"><a href="./admin.php?fname=product&feature=2&act=add"><span class="material-icons-outlined">
                add_circle_outline
            </span>Thêm sản phẩm</a></div>
    <?php
    $result = $conn->loadProductTable();
    echo "<table>
<tr>
<th>ID</th>
<th>Tên sản phẩm</th>
<th>Hình ảnh</th>
<th>Giá</th>
<th>Số lượng</th>
<th></th>
</tr>";
    while ($row = mysqli_fetch_array($result)) {
        echo "<tr>";
        echo "<td>" . $row['product_id'] . "</td>";
        echo "<td>" . $row['product_name'] . "</td>";
        echo "<td>" . "<img src='./img/product/" . $row['img'] . "' alt='Product pic' width='50px' height='50px'>" . "</td>";
        echo "<td>" . $row['price'] . "</td>";
        echo "<td>" . $row['quantity'] . "</td>";
        echo "<td>" . "<a href='./admin.php?fname=product&feature=2&act=info&productID=" . $row['product_id'] . "'><span class='material-icons-outlined'>visibility</span></a>"
            . "<a href='./admin.php?fname=product&feature=2&act=delete&productID=" . $row['product_id'] . "'><span class='material-icons-outlined'>delete</span></a>"
            . "<a href='./admin.php?fname=product&feature=2&act=update&productID=" . $row['product_id'] . "'><span class='material-icons-outlined'>settings</span></a>"
            . "</td>";
        echo "</tr>";
    }
    echo "</table>";
    ?>

</div>