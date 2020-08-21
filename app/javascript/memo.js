function memo() {

  const calculation = document.getElementById("item-price");
  calculation.addEventListener("change", (e) => {
    var price = $("#item-price").val();
    
    if( 300 <= price && price <= 9999999) {
    var fee = Math.floor(price / 10);
    var profit = (price - fee);
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

  



// 1、価格の部分のHTML要素をidに紐づけてとってくる
// 2、とってきた要素を使って入力させた後にイベントを定義する
// 3、価格の要素をidに紐づけてとってきて、それのvalueをとってくる
// 4、とってきた要素を使って販売手数料と販売利益を計算
// 5、販売手数料と販売利益のHTML要素をとってきて、計算結果をくっつける

