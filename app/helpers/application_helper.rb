module ApplicationHelper

  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'Login', new_user_session_path) +
      ("<br />".html_safe) +
      (link_to 'Register', new_user_registration_path)
    end
  end

  def source_helper
    if session[:source]
      content_tag(:p, "Thank you for visiting me from #{session[:source]}")
    end
  end

  def copyright_generator
    KersuzanViewTool::Renderer.copyright 'Kersuzan Anthony', 'All rights reserved'
  end

end
