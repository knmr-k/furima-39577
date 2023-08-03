window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  // priceInputを取得出来ない場合は動作を停止
  // if (!priceInput){
  //   return false;
  // }
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 販売手数料と販売利益に反映
    // addTaxPrice.innerHTML = Math.floor(inputValue * 0.1)
    // profit.innerHTML = Math.floor(inputValue - addTaxPrice.innerHTML)

    // 販売手数料と販売利益に反映, カンマ区切り
    addTaxPrice.innerHTML = Number(Math.floor(inputValue * 0.1)).toLocaleString()
    profit.innerHTML = Number(Math.floor(inputValue - Math.floor(inputValue * 0.1))).toLocaleString()
  });
});