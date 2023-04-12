<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/admin.css">
    <title>Admin</title>
    <?php
    include("./template/db_connection.php");
    $conn = new DatabaseConnection("localhost", "root", "", "cosmetic_store");
    $conn->connect();
    ?>
</head>

<body>
    <div class="grid-container">
        <!-- HEADER -->
        <div class="header"></div>
        <div class="header-left"></div>
        <div class="header-right"></div>
        <!-- HEADER -->
        <!-- STAR SIDE BAR -->
        <div class="sidebar">
            <div class="logo"></div>
            <div class="sidebar-list"></div>

        </div>
        <!-- END SIDE BAR -->
        <!-- STAR MAIN -->
        <div class="main">

        </div>
        <!-- END MAIN -->



    </div>


</body>

</html>