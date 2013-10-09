module ApplicationHelper
    def display_login
    if current_user
      concat content_tag(:li, link_to('Logout', destroy_user_session_path, :method=>'delete'))
      content_tag(:li, link_to('Edit account', edit_user_registration_path))

    else
      concat content_tag(:li, link_to('Login', new_user_session_path))
      content_tag(:li, link_to('Sign up', new_user_registration_path))
    end
  end
end
