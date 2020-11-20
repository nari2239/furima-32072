function price () {
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const inputPrice = itemPrice.value;
    const taxPrice = inputPrice * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");

    // 手数料が1円以上なら表示し、1円未満なら0円と表示する条件式
    if (taxPrice >= 1) {
      addTaxPrice.innerHTML = taxPrice;
    } else {
      addTaxPrice.innerHTML = 0;
    };

    const profitField = document.getElementById("profit");
    const profit = inputPrice - addTaxPrice.innerHTML;
    profitField.innerHTML = profit;
    
  });
}

window.addEventListener('load', price);