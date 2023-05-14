<?php
$conn = mysqli_connect("localhost", "root", "", "cosmetic_store");
function getCartTotalProduct($accountId)
{
    $sql = "SELECT COUNT(account_id) from cart WHERE account_id = $accountId";
    $result = mysqli_query($GLOBALS['conn'], $sql);
    $row = mysqli_fetch_array($result);

    return $row['COUNT(account_id)'];
}

if (isset($_SESSION['account_id'])) {
    $cartQuantity = getCartTotalProduct($_SESSION['account_id']);
    echo "<script type='text/javascript'>
        const basket =document.querySelector('#btn-basket');
        basket.dataset.totalProduct = $cartQuantity;
    </script>";
}
else {
    echo "<script type='text/javascript'>
        const basket =document.querySelector('#btn-basket');
        basket.dataset.totalProduct = 0;
    </script>";
}

if (isset($_GET['unLogedin'])) {
    echo "<script type='text/javascript'>alert('Vui lòng đăng nhập để xem giỏ hàng.');</script>";
    echo "<script>window.location='index.php'</script>";
}
?>