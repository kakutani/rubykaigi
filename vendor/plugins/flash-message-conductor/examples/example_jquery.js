$(document).ready(function() {
  setTimeout(hideFlashes, 25000);
});
 
var hideFlashes = function() {
  $('#flash_messages p.fade').fadeOut(1500);
}