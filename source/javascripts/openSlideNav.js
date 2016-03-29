$(function() {
  $('.js-open-slide-nav').click(function() {
    $('body').toggleClass('is-slided');
    return $('.js-slide-nav').toggleClass('is-slided');
  });
});
