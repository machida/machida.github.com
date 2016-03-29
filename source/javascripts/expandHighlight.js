$(function() {
  return $(".highlight").click(function() {
    var leftSpase;
    leftSpase = $('.container').width() - $('.article__body').width();
    if ($(this).hasClass("is-expanded")) {
      $(this).css('margin-left', '0');
      $(this).removeClass("is-expanded");
    } else {
      $(this).css('margin-left', leftSpase * -1);
      $(this).addClass("is-expanded");
    }
  });
});
