// set dynamic id to thumbs up
// remove link
// change icon

function thumbsup(){
  $this = $(this);
  downvote = $(this).parent('div').find('.newdownvote');
  scoreup = $(this).parent('div').find('.score_up');
  $cheer_id = $this.data("id");
  $.ajax({
    url: "/promotes",
    type: "POST",
    data: {promote:{
      cheer_id: $cheer_id,
      status: "liked"}},
    dataType: "json"
  }).success(function(data){
    $this.removeClass('newupvote');
    $this.addClass('clicked');
    $this.attr('data-id', data.id);
    downvote.attr('data-id', data.id);
    scoreup.text(parseInt(scoreup.text())+1);
    downvote.removeClass('newdownvote');
    downvote.addClass('changevotedown');
  });
}

function thumbsdown(){
    $this = $(this);
    upvote = $(this).parent('div').find('.newupvote');
    scoredown = $(this).parent('div').find('.score_down');
    $cheer_id = $this.data("id");
    $.ajax({
      url: "/promotes",
      type: "POST",
      data: {promote:{
        cheer_id: $cheer_id,
        status: "dislike"}},
      dataType: "json"
    }).success(function(data){
      $this.removeClass('newdownvote');
      $this.addClass('clicked');
      $this.attr('data-id', data.id);
      scoredown.text(parseInt(scoredown.text())+1);
      upvote.attr('data-id', data.id);
      upvote.removeClass('newupvote');
      upvote.addClass('changevoteup');
    });
  }

function changeVoteDown(){
    console.log("hello")
    $this = $(this);
    upvote = $(this).parent('div').find('.clicked');
    scoreup = $(this).parent('div').find('.score_up');
    scoredown = $(this).parent('div').find('.score_down');    
    id = $(this).attr("data-id");
    console.log(id)
    $.ajax({
      url: "/promotes/" + id,
      type: "PUT",
      data: {promote:{
        status: "dislike"}},
      dataType: "json"
    }).success(function(data){
      $this.removeClass('changevotedown');
      $this.addClass('clicked');
      upvote.addClass('changevoteup');
      upvote.removeClass('clicked');
      scoreup.text(parseInt(scoreup.text())-1);
      scoredown.text(parseInt(scoredown.text())+1);
    });
  }

function changeVoteUp(){
    $this = $(this);
    downvote = $(this).parent('div').find('.clicked');
    scoreup = $(this).parent('div').find('.score_up');
    scoredown = $(this).parent('div').find('.score_down'); 
    id = $(this).attr("data-id");
    $.ajax({
      url: "/promotes/" + id,
      type: "PUT",
      data: {promote:{
        status: "liked"}},
      dataType: "json"
    }).success(function(data){
      $this.removeClass('changevoteup');
      $this.addClass('clicked');
      downvote.addClass('changevotedown');
      downvote.removeClass('clicked');
      scoreup.text(parseInt(scoreup.text())+1);
      scoredown.text(parseInt(scoredown.text())-1);
    });
  }


$(function() {
    $('body').on('click', '.newupvote', thumbsup);
    $('body').on('click', '.newdownvote', thumbsdown);
    $('body').on('click', '.changevoteup', changeVoteUp);
    $('body').on('click', '.changevotedown', changeVoteDown);
  });