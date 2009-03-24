document.observe('dom:loaded', function() {
  setTimeout(hideFlashes, 25000);
});
 
var hideFlashes = function() {
  $$('#flash_messages p.fade').each(function(e) {
    if (e) Effect.Fade(e, { duration: 1.5 });
  })
}