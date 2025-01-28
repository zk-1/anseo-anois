class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_current_user

  def set_current_user
    @current_user = current_user
  end

  def current_user
    Current.session&.user
  end

  def insist_on_registered_user
    return if current_user

    notice = "You must be logged in to access this page."
    redirect_to("/", notice:)
  end
end
