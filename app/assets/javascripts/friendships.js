$(function() {
  return $("a[data-remote]").on("ajax:success", function(e, data, status, xhr) {
    var down;
    if ($(this).attr('class') === "upvote") {
      upvote = $(this).closest('li').find('.score_up'); 
      upvote.html(data);
      down = parseInt($(".score_down").html());
      downvote = $(this).closest('li').find('.score_down');
      return downvote.html(down - 1);
    }
    else if ($(this).attr('class') === "downvote") {
      downvote = $(this).closest('li').find('.score_down');
      downvote.html(data)
      up = parseInt($(".score_up").html());
      upvote = $(this).closest('li').find('.score_up');
      return upvote.html(up - 1);
    }
  });
});
