<% if @user %>
  location.reload(true)
<% else %>
  alert('登録できませんでした。')
<% end %>
