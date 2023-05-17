<?php $resultTypeID = $conn->admin_LoadProductType() ?>
<form class="filter" action="./admin.php" method="get">
    <input type="hidden" name="fname" value="statistic">
    <label for="dateFrom" class="font-weight-bold">Ngày bắt đầu</label>
    <input type="date" name="dateFrom">

    <label for="dateTo" class="font-weight-bold">Ngày kết thúc</label>
    <input type="date" name="dateTo">
    <label for="type" class="font-weight-bold">Loại sản phẩm</label>
    <select name="type" id="type">
        <option value="0" selected>Tất cả</option>
        <?php
        while ($row = mysqli_fetch_array($resultTypeID)) {
            echo ("<option value='" . $row['product_type_id'] . "' >" . $row['product_type_name'] . "</option>");
        }
        ?>
    </select>
    <input type="submit" name="btnFilter" value="Lọc">

</form>
<?php
if (isset($_GET['btnFilter'])) {

    $dateFrom = $_GET['dateFrom'];
    $dateTo = $_GET['dateTo'];
    $type = $_GET['type'];
    $result = $conn->soLuotBanTheoBill($dateFrom, $dateTo, $type);

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