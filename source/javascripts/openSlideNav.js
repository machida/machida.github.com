$(function() {
  $('.js-open-slide-nav').click(function() {
    $('html').toggleClass('is-slided');
    return $('.js-slide-nav').toggleClass('is-slided');
  });
});
