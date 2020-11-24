function price () {
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const inputPrice = itemPrice.value;
    const taxPrice = inputPrice * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(taxPrice);
    const profitField = document.getElementById("profit");
    const profit = inputPrice - addTaxPrice.innerHTML;
    profitField.innerHTML = profit;
    
  });
}

window.addEventListener('load', price);