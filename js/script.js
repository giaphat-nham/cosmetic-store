const btnBurger = document.querySelector(".burger");

btnBurger.addEventListener("click", e => expandFunction());

function expandFunction() {
  const line1 = document.getElementsByClassName("line-2")[0];
  const line2 = document.getElementsByClassName("line-2")[0];
  const line3 = document.getElementsByClassName("line-3")[0];
  const functions = document.getElementsByClassName("function")[0];

  if (
    line3.classList.contains("active") ||
    line2.classList.contains("active")
  ) {
    line3.classList.remove("active");
    line2.classList.remove("active");
    functions.classList.remove("active");
  } else {
    line3.classList.add("active");
    line2.classList.add("active");
    functions.classList.add("active");
  }
}