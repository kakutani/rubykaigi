// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// flash
jQuery.noConflict();
(function($) {
   $(document).ready(function() {
     setTimeout(hideFlashes, 2000);
    });

    var hideFlashes = function() {
      $('#flash_messages p.fade').fadeOut(2000);
    }
})(jQuery);
