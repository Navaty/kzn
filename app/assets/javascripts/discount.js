
$(document).on('turbolinks:load', function () {
  $('.image-sortable').sortable({
    axis: 'y',
    items: '.image'
  });

  $('.add-image').click(function () {
    $('.image-sortable').append('<div class="image"><input multiple="multiple" type="file" name="post[images][]"></div>');
  });

  $('.remove-image').click(function () {
    $(this).parent('.image').remove();
  });
});