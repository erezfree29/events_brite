module ApplicationHelper
  def nav_bar
    content_tag(:div, class: 'nav_bar') do
      content_tag(:div, class: 'sign_in_links') do
        (link_to 'Home', root_path, class: 'home') +
          (button_to 'Sign up', new_user_path, method: :get if !logged_in? && controller_name != 'users') +
          (button_to 'Log in', new_session_path, method: :get unless logged_in?) +
          (button_to 'Sign out', sign_out_path, method: :delete if logged_in?)
      end
    end
  end

  def logged_in_name
    content_tag(:h1) { "User #{current_user.name}" } if logged_in?
  end
end
