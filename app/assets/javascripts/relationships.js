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
   $('.follow').replaceWith("<button class='btn unfollow' data-id='" + data +"'>unfollow</button>")
})
};
relationshipAjax.deleteRelationship = function(relationship_id){
 console.log('deleteRelationship');
  // $this = $(this);
  // var relationshipId = $this.data('id')
  //   console.log('delete post')
  //     $.ajax({
  //       url: '/relationships/' + relationshipId,
  //       type: 'DELETE',
  //       dataType: 'json'
  //     }).success(function(data){
  //       console.log(data, 'the ajax call was successful');
  //     });
    }







$(document).ready(function(){
  $('.follow').on('click', function(event){
    // console.log(event)
    event.preventDefault();
    user_id = $(this).data("value")
    relationshipAjax.createRelationship(user_id)
  });
  $('.unfollow').on('click', function(event){
    console.log(event)
    event.preventDefault();
 
    var relationship_id = $(this).data("id")
    relationshipAjax.deleteRelationship(relationship_id)
  });
})  

