<% if @user %>
  location.reload(true)
<% else %>
  alert('更新できませんでした。')
<% end %>
