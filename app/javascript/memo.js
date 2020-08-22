function memo() {

  const calculation = document.getElementById("item-price");
  calculation.addEventListener("change", (e) => {
    let price = $("#item-price").val();
    
    if( 300 <= price && price <= 9999999) {
    let fee = Math.floor(price / 10);
    let profit = (price - fee);
    $("#add-tax-price").text(fee);
    $("#profit").text(profit);
    }else{
    $("#add-tax-price").text('');
    $("#profit").text('');
    document.getElementById("item-price").value;
    }
    
  })
}
window.addEventListener("load", memo);

  

