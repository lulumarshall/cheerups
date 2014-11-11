function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data,
  })
}

//add to the Cheer list 
function appendNewCheer(data){
  $("%li#cheer-" + "cheer.id'")
}    


//POST Cheer 
function createCheer(){
  request("POST", "/cheers", {
    task:{
      title: $("#new-cheer").val()
    }
  }).success(function(data){
    //console.log(data);
    $('#new-cheer').val( )
    appendNewCheer(data)
  })
}




$(document).ready(function(){
  console.log('dom loaded')
  $('#new-cheer').on('keypress', function(event){
    if(event.which == '13')createCheer()
      console.log('key press')
  });
});
