<form class="date" action="./admin.php" method="get">
    <input type="hidden" name="fname" value="statistic">
    <label for="dateFrom" class="font-weight-bold">Ngày bắt đầu</label>
    <input type="date" name="dateFrom">

    <label for="dateTo" class="font-weight-bold">Ngày kết thúc</label>
    <input type="date" name="dateTo">
    <input type="submit" name="btnFilter" value="Lọc">
</form>
<?php
if (isset($_GET['btnFilter'])) {

    $dateFrom = $_GET['dateFrom'];
    $dateTo = $_GET['dateTo'];
    $result = $conn->soLuotBanTheoBill($dateFrom, $dateTo);

    echo "<table>
<tr>
<th>ID</th>
<th>Tên sản phẩm</th>
<th>Số lượt bán</th>

</tr>";
    while ($row = mysqli_fetch_array($result)) {
        echo "<tr>";
        echo "<td>" . $row['product_id'] . "</td>";
        echo "<td>" . $row['product_name'] . "</td>";
        echo "<td>" . $row['count'] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
}

?>