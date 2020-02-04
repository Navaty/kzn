$(document).on('turbolinks:load', function () {
  $('.image-sortable').sortable({
    axis: 'y',
    items: '.image'
  });

  $('.remove-image').click(function () {
    $(this).parent('.image').remove();
  });


$('.add_address').click(function() {
	time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
  });

});

