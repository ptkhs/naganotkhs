$(function(){
  function buildHTML(destination){
    var html = `<tr>
                  <td>
                    ${destination.zipcode}
                  </td>
                  <td>
                    ${destination.address}
                  </td>
                  <td>
                    ${destination.name}
                  </td>
                  <td>
                  　　あとでDELETE追加
                  </td>
                </tr>`
    return html;
  }
  $('form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      url: "/post/destinations",
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.destination_item').append(html)
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
