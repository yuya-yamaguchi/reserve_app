$(function() {
  $(".reserving__form__datetime--time").change(function(){
    
    var start_time = $('#start_time').val();
    var end_time = $('#end_time').val();
    var base_fee = $('#base_fee').val();

    // 入力値チェック
    if (start_time >= end_time) {
      alert('時間の設定に誤りがあります');
      return;
    }
    
    // 利用時間算出
    use_time = end_time - start_time
    // 支払料金算出
    chaged_fee = base_fee * use_time

    $("#payment_fee").text(chaged_fee + " 円");
  });

});