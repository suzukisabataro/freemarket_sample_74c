$(function(){
  $('#price_calc').on('input', function(){
    const data = $('#price_calc').val();
    const profit = Math.round(data * 0.9)
    const fee = (data - profit)
    $('.right_bar').html(fee)
    $('.right_bar').prepend('¥')
    $('.right_bar_2').html(profit)
    $('.right_bar_2').prepend('¥')
    $('#price').val(profit)
    if(profit == ''){
      $('right_bar_2').html('');
      $('right_bar_2').html('');
    }
  })
})
