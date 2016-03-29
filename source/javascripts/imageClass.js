$(function() {
  $('.post-body img').each(function(){
    var alt = $(this).attr('alt');
    if (alt.match(/xs/)) {
      $(this).addClass('is-xs');
      }
    else if (alt.match(/sm/)) {
      $(this).addClass('is-sm');
      }
    else if (alt.match(/md/)) {
      $(this).addClass('is-md');
      }
    else if (alt.match(/lg/)) {
      $(this).addClass('is-lg');
      }
    else if (alt.match(/xl/)) {
      $(this).addClass('is-xl');
      }
  });
});
