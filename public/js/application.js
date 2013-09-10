$(document).ready(function() {
  $('#twitter_finder').on('submit', function(e){
    e.preventDefault();
    $('.user_twitter').hide()
// show image
    $('.container').append("<div class='loader'><img src='/img/ajax-loader.gif' /></div>")
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize(),
    })
    .done(function(data) {
      $('img').hide()
      $('.container').append(data)
    })
  });
});
