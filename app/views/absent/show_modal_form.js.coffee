$('.modal-form').html('<%= escape_javascript( render partial: 'absent/form' ) %>')
$('#modal-form').modal()
