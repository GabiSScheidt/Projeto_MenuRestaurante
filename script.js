window.addEventListener("scroll", () => {
  const header = document.querySelector("header");
  header.classList.toggle("sticky", window.scrollY > 0);
});

const menuToggle = document.querySelector(".menu-toggle");
const nav = document.querySelector("nav");
const listItems = document.querySelectorAll(".list-item");

menuToggle.addEventListener("click", () => {
  menuToggle.classList.toggle("active");
  nav.classList.toggle("active");
});

listItems.forEach(listItem => {
  listItem.addEventListener("click", () => {
    menuToggle.classList.remove("active");
    nav.classList.remove("active");
  });
});