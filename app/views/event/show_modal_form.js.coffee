$('.modal-form').html('<%= escape_javascript( render partial: 'event/form' ) %>')
$('#modal-form').modal()