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
  $('#commentpreviewtoggle').show();
  $('#commentpreview').html(converter.makeHtml($('#comment-form-message').val()));
}

// Static comments submission code
// from: https://github.com/eduardoboucas/popcorn/blob/gh-pages/js/main.js
(function ($) {
  var $comments = $('.js-comments');

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
        showModal('Comment submitted', 'Thanks! Your comment is pending. It will appear when approved.');
        $('.js-modal-text').removeClass('js-modal-text-error');
        $("#comment-form-submit").html("Submit");
        $(form)[0].reset();
        $(form).removeClass('disabled');
        grecaptcha.reset();
      },
      error: function (err) {
        console.log(err);
        var ecode = (err.responseJSON || {}).errorCode || "unknown";
        showModal('Error', 'An error occured.<br>[' + ecode + ']');
        $('.js-modal-text').addClass('js-modal-text-error');
        $("#comment-form-submit").html("Submit");
        $(form).removeClass('disabled');
        grecaptcha.reset();
      }
    });
    return false;
  });

  $('.js-close-modal').click(function () {
    $('body').removeClass('show-modal');
  });

  function showModal(title, message) {
    $('.js-modal-title').text(title);
    $('.js-modal-text').html(message);
    $('body').addClass('show-modal');
  }
})(jQuery);