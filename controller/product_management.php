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
    echo "<td>" . "<a href='./admin.php?fname=product&feature=2&act=delete'><span class='material-icons-outlined'>delete</span></a>"
        . "<a href='./admin.php?fname=product&feature=2&act=update'><span class='material-icons-outlined'>settings</span></a>" . "</td>";
    echo "</tr>";
}
echo "</table>";
?>


<span class="material-icons-outlined">
    settings
</span>