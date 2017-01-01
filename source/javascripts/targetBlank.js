$(document).ready(function(){
 // external links to new window
  $('a[href^="http"]').attr('target','_blank');
  // force PDF Files to open in new window
  $('a[href$=".pdf"]').attr('target', '_blank');
});
