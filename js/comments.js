// Showdown markdown preview code
showdown.setFlavor('github');
showdown.setOption('smoothLivePreview', 'true');
var converter = new showdown.Converter();

// Toggle
$('#comment-form-show-preview').change(function() {
 $('#commentpreviewsection').toggle(this.checked);
});

// Show Captcha and update preview on key up, so when the user types something in the comment field
function commentTextFieldOnKeyUp() {
  $('.g-recaptcha').show();
  $('#commentpreview').html(converter.makeHtml($('#comment-form-message').val()));
}

// Static comments submission code
// from: https://github.com/eduardoboucas/popcorn/blob/gh-pages/js/main.js
$('.js-form').submit(function () {
  var form = this;

  $("#comment-form-submit").html('Please Wait...');
  $(form).addClass('disabled');

  $.ajax({
    type: $(this).attr('method'),
    url:  $(this).attr('action'),
    data: $(this).serialize(),
    contentType: 'application/x-www-form-urlencoded',
    success: function (data) {
      $('#comment-form-submit-result').html('<p>Thanks! Your comment will go live in a couple of minutes.</p>');
      $('#comment-form-submit-result').attr('class', 'notes');
      $('#comment-form-submit-result').show();
      $("#comment-form-submit").html("Submit");
      $(form)[0].reset();
      $(form).removeClass('disabled');
      grecaptcha.reset();
      setTimeout(function() { $("#comment-form-submit-result").fadeOut();}, 5000);
    },
    error: function (err) {
      console.log(err);
      var ecode = (err.responseJSON || {}).errorCode || "unknown";
      var error = ecode.replaceAll("-", " ").replaceAll("_", " ").toLowerCase().replace(/(^\s*\w|[\.\!\?]\s*\w)/g,function(c){return c.toUpperCase()});
      $('#comment-form-submit-result').html('<p>' + error + '. Your comment could not be posted, please fix the problem and try again.</p>');
      $('#comment-form-submit-result').attr('class', 'warning');
      $('#comment-form-submit-result').show();
      $("#comment-form-submit").html("Submit");
      $(form).removeClass('disabled');
      grecaptcha.reset();
      setTimeout(function() { $("#comment-form-submit-result").fadeOut();}, 5000);
    }
  });
  return false;
});