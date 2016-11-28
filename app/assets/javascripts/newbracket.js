$(function() {
  console.log(window.location.pathname)
  console.log("/")

  if (window.location.pathname === '/') {
    $('.nav').css('display', 'none');
    $('.page-container').css('margin-left', '0');
  }

});
