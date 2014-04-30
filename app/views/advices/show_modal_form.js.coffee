$('.modal-form').html('<%= escape_javascript( render partial: 'advices/form' ) %>')
$('#modal-form').modal()