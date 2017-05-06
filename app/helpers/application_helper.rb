module ApplicationHelper

  def login_helper(class_name)
    if current_user.is_a?(GuestUser)
      (link_to 'Login', new_user_session_path, class: class_name) +
      " " +
      (link_to 'Register', new_user_registration_path, class: class_name)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: class_name
    end
  end

  def source_helper
    if session[:source]
      content_tag(:p, "Thank you for visiting me from #{session[:source]}")
    end
  end

  def copyright_generator
    copyright = KersuzanViewTool::Renderer.copyright 'Kersuzan Anthony', 'All rights reserved'
    content_tag :p, copyright
  end

end
