<div class="bill-table">
    <?php
    $result = $conn->loadOrderTable();

    echo "<table>
<tr>
<th>ID</th>
<th>Mã khách hàng</th>
<th>Giá</th>
<th>Ngày</th>
<th>Trạng thái</th>
<th></th>
</tr>";
    while ($row = mysqli_fetch_array($result)) {
        echo "<tr>";
        echo "<td>" . $row['bill_id'] . "</td>";
        echo "<td>" . $row['customer_id'] . "</td>";

        echo "<td>" . $row['price'] . "</td>";
        echo "<td>" . $row['date'] . "</td>";
        if ($row['bill_state'] == 1) {
            echo "<td>Đã xử lý</td>";
        } else {
            echo "<td>Chưa xử lý</td>";
        }

        echo "<td>" . "<a href='./admin.php?fname=product&feature=2&act=info&billID=" . $row['bill_id'] . "'><span class='material-icons-outlined'>visibility</span></a>"
            . "<a href='./admin.php?fname=product&feature=2&act=update&billID=" . $row['bill_id'] . "'><span class='material-icons-outlined'>settings</span></a>"
            . "</td>";
        echo "</tr>";
    }
    echo "</table>";
    ?>

</div>