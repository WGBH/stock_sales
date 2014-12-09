// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
var reloadImages = function() {
  var styles, style, url, _i, _len, _el;
  styles = Array.prototype.slice.call(document.body.querySelectorAll('[style]'));
  for (_i = 0, _len = styles.length; _i < _len; i++) {
    _el = styles[_i]
    style = _el.getAttribute('style');
    if (!(style.indexOf('url(') > -1)) {
      continue;
    }
    url = style.match(/url\((.*)\)/)[1];
    _el.style.backgroundImage = 'url(' + url + ')';
  }
}
$(document).on('page:change', function() {
  reloadImages();
});  
