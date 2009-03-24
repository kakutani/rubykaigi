// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// flash
document.observe('dom:loaded', function() {
  setTimeout(hideFlashes, 2000);
});

var hideFlashes = function() {
  $$('#flash_messages p.fade').each(function(e) {
    if (e) Effect.Fade(e, { duration: 1.6 });
  })
}
