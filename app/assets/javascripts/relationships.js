relationshipAjax = {} 

relationshipAjax.createRelationship = function(){
  var followed = parseInt(window.location.href.split('/').pop())
   $.ajax({
    url: '/relationships',
    type: 'POST',
    data:{followed_id: followed},
    dataType: 'json'
   }).success(function(data){
    var old_value = $('button').data('value')
    var new_value = old_value + 1
    console.log(new_value)
   $("#followers").text(new_value)
   $('.follow').replaceWith("<button class='btn unfollow' data-id='" + data +"' data-value='"+ new_value + "'>unfollow</button>") 
})
};
relationshipAjax.deleteRelationship = function(relationship_id){
 console.log('deleteRelationship');
      $.ajax({
        url: '/relationships/' + relationship_id,
        type: 'DELETE',
        dataType: 'json'
      }).success(function(data){
        console.log(data, 'the ajax call was successful');
        var old_value = $('button').data('value')
        var new_value = old_value - 1
        console.log(new_value)
      $("#followers").text(new_value)
      $('.unfollow').replaceWith("<button class='btn btn-primary follow' data-id='" + data +"' data-value='"+ new_value + "'>follow</button>")
      });
    }

$(document).ready(function(){
  $("body").on('click', ".follow", function(event){
    // var following_id = $(this).data("value")
    relationshipAjax.createRelationship()
  });
  $("body").on('click', '.unfollow', function(event){
    console.log(event)
    var relationship_id = $(this).data("id")
    relationshipAjax.deleteRelationship(relationship_id)
  });
})  








