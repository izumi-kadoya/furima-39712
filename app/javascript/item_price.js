document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price"); 
      const value = parseInt(priceInput.value); 
      
      if (!isNaN(value)) { 
        const taxAmount = Math.floor(value / 10);
        addTaxDom.innerHTML = taxAmount.toLocaleString(); 

        const taxProfitDom = document.getElementById("profit"); 
        const taxProfit = value - taxAmount; 
        taxProfitDom.innerHTML = taxProfit.toLocaleString(); 
      }
    });
  }
});