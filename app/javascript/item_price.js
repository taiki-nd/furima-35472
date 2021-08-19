function price (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const tax = itemPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${tax}`;
    const SalesProfit = itemPrice.value - tax ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

window.addEventListener('load', price);