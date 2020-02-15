$(function(){
  function buildHTML(cart){
    var html = `${cart.end_user_id}
                ${cart.item_id}
                ${cart_item.item_id}`
    return html;
  }
  $('#new_item').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      url: "/items/:id",
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.body').append(html)
      $('.b').val('')
    })
    .fail(function(){
      alert('投稿できませんでした')
    })
    .always(function(){
      $(".c").removeAttr("disabled")
    })
  })
});