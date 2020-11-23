const card = () => {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("発火");
  });
};
window.addEventListener('load', card);