$('.modal-form').html('<%= escape_javascript( render partial: 'attends/form' ) %>')
$('#modal-form').modal()