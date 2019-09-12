$(document).on('turbolinks:load', function() {
  $('.send').prop("disabled", true);
  
  $('form input:required').each(function () {
      $(this).prev("label").addClass("required");
  });
  
  $('form input:required').change(function () {
      let flag = true;
      $('form input:required').each(function(e) {
          if ($('form input:required').eq(e).val() === "") {
              flag = false;
          }
      });
  
      if (flag) {
          $('.send').prop("disabled", false);
      }
      else {
          $('.send').prop("disabled", true);
      }
  });
});