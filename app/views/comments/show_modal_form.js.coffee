$('.modal-form').html('<%= escape_javascript( render partial: 'comments/form' ) %>')
$('#modal-form').modal()