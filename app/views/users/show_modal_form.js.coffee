$('.modal-form').html('<%= escape_javascript( render partial: 'users/form' ) %>')
$('#modal-form').modal()