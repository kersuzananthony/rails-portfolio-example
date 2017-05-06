module CurrentUserConcern

  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  private
  def guest_user
    guest_user = GuestUser.new
    guest_user.name = 'Guest User'
    guest_user.first_name = 'Guest'
    guest_user.last_name = 'User'
    guest_user.email = 'guest.user@example.com'

    guest_user
  end
end