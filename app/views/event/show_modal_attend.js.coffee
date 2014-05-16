$('.modal-attend').html('<%= escape_javascript( render partial: 'event/attend' ) %>')
$('#modal-attend').modal()
