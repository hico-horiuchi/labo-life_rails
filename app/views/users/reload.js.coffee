<% if @user %>
  location.href="/users"
<% else %>
  locatiton.reload(true)
<% end %>
