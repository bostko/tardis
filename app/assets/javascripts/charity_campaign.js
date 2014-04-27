$(document).ready(function() {
    $('.information-button').click(function (e) {
      e.preventDefault();
      $('.information-tab').addClass('active');
      $('.clarity-tab').removeClass('active');
      $('.description').removeClass('hidden');
      $('.money-container').addClass('hidden');
    });

    $('.clarity-button').click(function (e) {
      e.preventDefault();
      $('.information-tab').removeClass('active');
      $('.clarity-tab').addClass('active');
      $('.description').addClass('hidden');
      $('.money-container').removeClass('hidden');
    });
});
