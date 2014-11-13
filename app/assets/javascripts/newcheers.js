function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "script",
    data: data,
  })
}

//add to the Cheer list 
//function appendNewCheer(data){
  
  //$('<li id="cheer-'+ data.id + '">' + '<span class="user"><a href="/users/'+ data.user_id + '"></a></span><span class="content">'+ data.cheerup +'</span><span class="timestamp"></span><div class="edit"><a href="/cheers/'+ data.id +'/edit">Edit</a></div><div class="destroy"><a href="/cheers/'+ data.id + '" data-confirm="Are you sure?" data-method="delete" rel="nofollow">x</a></div><span class="/cheers/'+ data.id +'/cheerup" data-method="put" rel="nofollow">cheerUp!</a></span><span class="score">0</span></li>').prependTo("#cheers") 
 
  

//POST Cheer 
function createCheer(){
  request("POST", "/cheers", {
    cheer:{
      cheerup: $("#new-cheer").val()

    }
  }).success(function(data){
    // console.log(data);
    // $('#new-cheer').val( )
    // appendNewCheer(data)
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




