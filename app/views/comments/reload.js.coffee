<% if @comment %>
  location.href="/reports/<%= @comment.report.id %>"
<% else %>
  locatiton.reload(true)
<% end %>
