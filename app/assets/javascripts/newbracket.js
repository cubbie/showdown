$(function() {

  if (window.location.pathname === '<%= root_path %>') {
    $('.nav').css('display', 'none');
    $('.page-container').css('margin-left', '0');
  }

});
