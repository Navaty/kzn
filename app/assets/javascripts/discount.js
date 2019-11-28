
$(document).on('turbolinks:load', function () {
  $('.image-sortable').sortable({
    axis: 'y',
    items: '.image'
  });

  $('.remove-image').click(function () {
    $(this).parent('.image').remove();
  });
});