function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "script",
    data: data,
  })
}

function createCheer(){
  request("POST", "/cheers", {
    cheer:{
      cheerup: $("#new-cheer").val()
    }
  })
}

function deleteCheer(event){
  event.preventDefault();
  var $this = $(this);
  console.log($this)
  var cheerId = $this.data("id");
  console.log(cheerId)
  $.ajax({
    url: '/cheers/' + cheerId,
    type: 'DELETE',
    dataType: 'json'
  }).success(function(){
   $this.closest('li').remove();
  })
}


$(document).ready(function(){
  console.log('dom loaded')
  $('#new-cheer').on('keypress', function(event){
    if(event.which == '13')createCheer()
      console.log('key press')
  });

  $('#cheers').on('click', ".destroy", deleteCheer);

});




