$(document).on('turbolinks:load', function(){
  $('.fadein_area ul li').hide();
  $('.fadein_area ul li').each(function(i) {
  $(this).delay(100 * i).fadeIn(1000);
  });
  $('#pagetop').click(function () {
    $("html,body").animate({scrollTop:0},"300");
});
});