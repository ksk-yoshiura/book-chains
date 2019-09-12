$(document).on('turbolinks:load', function(){
  $(document).on('keyup', '#form', function(e){
  e.preventDefault();
  var input = $.trim($(this).val());
  
  $.ajax({ 
    url: '/chains/search',
    type: 'GET', 
    data: ('keyword=' + input), 
    processData: false,
    contentType: false,
    dataType: 'json'
  })
  .done(function(data){ 
    $('#result').find('li').remove();
    $(data).each(function(i, user){
      $('#result').append('<li>' + user.name + '</li>')
    });
  })
});
});
