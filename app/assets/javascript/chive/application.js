//= require rails-ujs
//= require activestorage
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require flatpickr

/**
 * Preview an image before upload
 * 
 * Example:
 * 
 * <%= image_tag 'blank', class: 'image-preview' %>
 * <%= check_box_tag :delete_preview, 'delete', false, class: 'delete-preview' %>
 * <%= f.file_field :image, class: 'image-upload', data: {preview: '.image-preview', delete: '.delete-preview' } %>
 */
$(function () {
  var readURL = function(input) {
    let preview = $(input).attr('data-preview');
    let deleter = $(input).attr('data-delete');
 
    if (preview) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
 
        reader.onload = function (e) {
          $(preview).attr('src', e.target.result);
        }
 
        reader.readAsDataURL(input.files[0]);
        $(preview).parent().show();
        $(deleter).show();
        $(deleter).data('preview', $(preview));
        $(deleter).data('input', $(input));
        $('.delete-image').hide();
      } else {
        $(preview).parent().hide();
        $(deleter).hide();
        $('.delete-image').show();
      }
    }
  }
 
  $('.image-upload').change(function () {
    readURL(this);
  });

  $('.image-upload').each(function (_, input) {
    readURL(input);
  });

  $('.delete-preview').click(function (event) {
    event.preventDefault();
    $(this).data('input').val('');
    $(this).data('preview').attr('src', '');
    $(this).data('preview').parent().hide();
    $(this).hide();
    $('.delete-image').show();
  })

  $('.delete-image').change(function() {
    if ($(this).find('input').is(':checked')) {
      $(this).addClass('checked');
      $('.attached-image').parent().hide();
    } else {
      $(this).removeClass('checked');
      $('.attached-image').parent().show();
    }
  });
});

// Date/time pickers
$(function () {
  flatpickr('.flatpickr-date');
  flatpickr('.flatpickr-datetime', { enableTime: true });
});

// Editable slugs
$(function () {
  $('.input-slug').attr('disabled', !$('input[name="edit_slug_checkbox"]').is(':checked'));

  $('input[name="edit_slug_checkbox"]').change(function(event) {
    $('.input-slug').attr('disabled', !event.currentTarget.checked);
    if (!event.currentTarget.checked) {
      $('.input-slug').val($('input[name="curr_slug"]').val());
    }
  });
});
