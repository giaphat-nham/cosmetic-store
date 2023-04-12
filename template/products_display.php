<div class="catalog-title">
    <div class="title">
        <?php
        if (isset($_GET['nav'])) {
            switch ($_GET['nav']) {
                case "brand":
                    echo "Sản phẩm theo thương hiệu";
                    break;
                case "facecare":
                    echo "Sản phẩm chăm sóc da mặt";
                    break;
                case "bodycare":
                    echo "Sản phẩm chăm sóc cơ thể";
                    break;
                case "makeup":
                    echo "Sản phẩm Makeup";
                    break;
            }
        }
        ?>
    </div>
    <div class="product-sort">
        <select name="product-sort" id="">
            <option value="1">A - Z</option>
            <option value="2">Z - A</option>
            <option value="3">Giá &uarr;</option>
            <option value="4">Giá &darr;</option>
        </select>
    </div>
</div>
<div class="product-catalog-container">
    <div class="product-catalog">
        <div class="product-cell">
            <div class="product">
                <img src="./img/png/brand.png" alt="">
                <div class="product-price">
                    <div class="price">300000</div>
                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="22"
                        height="22">
                        <path
                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                    </svg>
                </div>
                <div class="product-brand">Tên thương hiệu</div>
                <div class="product-name">Tên sản phẩm</div>
            </div>
        </div>
        <div class="product-cell">
            <div class="product">
                <img src="./img/png/brand.png" alt="">
                <div class="product-price">
                    <div class="price">300000</div>
                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="22"
                        height="22">
                        <path
                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                    </svg>
                </div>
                <div class="product-brand">Tên thương hiệu</div>
                <div class="product-name">Tên sản phẩm</div>
            </div>
        </div>
        <div class="product-cell">
            <div class="product">
                <img src="./img/png/brand.png" alt="">
                <div class="product-price">
                    <div class="price">300000</div>
                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="22"
                        height="22">
                        <path
                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                    </svg>
                </div>
                <div class="product-brand">Tên thương hiệu</div>
                <div class="product-name">Tên sản phẩm</div>
            </div>
        </div>
        <div class="product-cell">
            <div class="product">
                <img src="./img/png/brand.png" alt="">
                <div class="product-price">
                    <div class="price">300000</div>
                    <svg class="heart checked" xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24"
                        width="22" height="22">
                        <path
                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                    </svg>
                </div>
                <div class="product-brand">Tên thương hiệu</div>
                <div class="product-name">Tên sản phẩm</div>
            </div>
        </div>
        <div class="product-cell">
            <div class="product">
                <img src="./img/png/brand.png" alt="">
                <div class="product-price">
                    <div class="price">300000</div>
                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="22"
                        height="22">
                        <path
                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                    </svg>
                </div>
                <div class="product-brand">Tên thương hiệu</div>
                <div class="product-name">Tên sản phẩm</div>
            </div>
        </div>
        <div class="product-cell">
            <div class="product">
                <img src="./img/png/brand.png" alt="">
                <div class="product-price">
                    <div class="price">300000</div>
                    <svg class="heart" xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="22"
                        height="22">
                        <path
                            d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z" />
                    </svg>
                </div>
                <div class="product-brand">Tên thương hiệu</div>
                <div class="product-name">Tên sản phẩm</div>
            </div>
        </div>
    </div>
    <div class="page-nav">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#" class="active">3</a>
        <a href="#">2</a>
        <a href="#">2</a>
        <a href="#">2</a>
    </div>
</div>