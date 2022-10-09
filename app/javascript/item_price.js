function price() {
  const priceInput = document.getElementById("item-price")

  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value
    const addTaxDom = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    profit.innerHTML = Math.floor(inputValue - inputValue * 0.1)
  })
}

window.addEventListener('load', price)
