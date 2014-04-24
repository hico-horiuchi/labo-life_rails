$('.modal-form').html('<%= escape_javascript( render partial: 'seminors/form' ) %>')
$('#modal-form').modal()