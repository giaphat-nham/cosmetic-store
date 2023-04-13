<?php
class DatabaseConnection
{
    private $host;
    private $username;
    private $password;
    private $db;
    private $conn;

    public function __construct($host, $username, $password, $db)
    {
        $this->host = $host;
        $this->username = $username;
        $this->password = $password;
        $this->db = $db;
    }

    public function connect()
    {
        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->db);
        //check connection
        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }
    public function close()
    {
        $this->conn->close();
    }

    public function getBrands()
    {
        $sql = "SELECT brand_name, display_name FROM brand";
        $result = mysqli_query($this->conn, $sql);
        $arr = array();

        while ($row = mysqli_fetch_array($result)) {
            array_push($arr, $row);
        }

        return $arr;
    }

    public function loadProductsBrand()
    {
        if (isset($_POST['page_num'])) {
            $pageNum = $_POST['page_num'];
        } else {
            $pageNum = 1;
        }
        $brandName = $_GET['brand'];
        $sql = "SELECT brand_id FROM brand WHERE brand_name = '" . $brandName . "'";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);
        $brandId = $row['brand_id'];

        $start = ($pageNum - 1) * 16;
        $sql = "SELECT product_name, product".'.'."img, price, display_name FROM product, brand WHERE product".'.'."brand_id = $brandId AND product" . '.' . "brand_id = brand" . '.' . "brand_id AND state = 1 LIMIT $start,16";
        $result = mysqli_query($this->conn, $sql);

        while ($row = mysqli_fetch_array($result)) {
            echo "
            <div class='product-cell'>
                <div class='product'>
                    <img src='./img/product/" . $row['img'] . "' alt='product image'>
                    <div class='product-price'>
                        <div class='price'>" . number_format($row['price'], 0, '', '.') . "</div>
                        <svg class='heart' xmlns='http://www.w3.org/2000/svg' id='Outline' viewBox='0 0 24 24' width='22'
                            height='22'>
                            <path
                                d='M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z' />
                        </svg>
                    </div>
                    <div class='product-brand'>" . $row['display_name'] . "</div>
                    <div class='product-name'>" . $row['product_name'] . "</div>
                </div>
            </div>";
        }
    }

    public function getBrandDisplayName($name) {
        $sql = "SELECT display_name FROM brand WHERE brand_name = '$name'";
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_array($result);

        return $row['display_name'];
    }

}
?>