module ApplicationHelper
  def linebreak_to_br(text)
    text.gsub(/\r\n|\r|\n/, '<br />').html_safe
  end
end
