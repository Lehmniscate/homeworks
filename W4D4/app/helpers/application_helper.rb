module ApplicationHelper

  def auth_token
    html = "<input type='hidden' name='authenticity_token'value='".html_safe
    html += form_authenticity_token.html_safe
    html += "'>'".html_safe
    html
  end

end
