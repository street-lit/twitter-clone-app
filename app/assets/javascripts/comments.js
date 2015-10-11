// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#newComment').on('click', function () {
  $.ajax({
    url: '/comments',
    dataType: 'JSON',
    method: "POST",
    data: {
      comment: {
        body:     $('#comment_body').val(),
        tweet_id:  $('#comment_tweet_id').val()
      }
    },
    success: function (response) {
      $('#comment_body').val('');
      $('.comments').prepend('<h3>Comment Posted!</h3>');
      $('.comments ul').append('<li><strong> Comment ID: ' + response.id + '</strong> ' + response.body + '</li>');
    }
  });
});
