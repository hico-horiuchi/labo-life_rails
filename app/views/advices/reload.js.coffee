<% if @advice %>
  location.href="/reports/<%= @advice.report.id %>"
<% else %>
  locatiton.reload(true)
<% end %>
