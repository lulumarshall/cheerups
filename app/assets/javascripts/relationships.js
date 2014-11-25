relationshipAjax = {} 

relationshipAjax.createRelationship = function(user_id){
  console.log('createRelationship');
  // debugger;
   // var follower = user_id
   var followed = parseInt(window.location.href.split('/').pop())
   $.ajax({
    url: '/relationships',
    type: 'POST',
    data:{followed_id: followed},
    dataType: 'json'
   }).success(function(data){
   console.log(data);
   $("#followers").text(parseInt($("#followers").text())+1)
   $("#following").text(parseInt($("#following").text())+1)
   $('.follow').replaceWith("<button class='btn unfollow' data-id='" + data +"'>unfollow</button>")
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
      $("#following").text(parseInt($("#following").text())-1)
      $("#followers").text(parseInt($("#followers").text())-1)
      $('.unfollow').replaceWith("<button class='btn btn-primary follow' data-id='" + data +"'>follow</button>")
      });
    }

$(document).ready(function(){
  $("body").on('click', ".follow", function(event){
    user_id = $(this).data("value")
    relationshipAjax.createRelationship(user_id)
  });
  $("body").on('click', '.unfollow', function(event){
    console.log(event)
    var relationship_id = $(this).data("id")
    relationshipAjax.deleteRelationship(relationship_id)
  });
})  

