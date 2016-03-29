$(document).ready(function(){
 // external links to new window
  $('a[href^="http://"]').not('a[href*=mydomainname]').attr('target','_blank');
  // force PDF Files to open in new window
  $('a[href$=".pdf"]').attr('target', '_blank');
});
