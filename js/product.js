const product = document.querySelector(".product-cell");
product.addEventListener("click", (e) => {
  window.location.href = "./product_details.php";
  console.log("product clicked");
});
