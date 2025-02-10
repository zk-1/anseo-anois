class UsersController < ApplicationController
  before_action :set_current_user
  allow_unauthenticated_access only: %i[ new create ]
  before_action :insist_on_registered_user, only: %i[ show ]

  before_action :validate_google_csrf, only: :google_sign_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @user = User.find(params[:id])
  end

  def google_sign_in
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV["GOOGLE_CLIENT_ID"])
    return render json: { error: "Email not verified" }, status: :unauthorized unless payload["email_verified"]
    set_user_from_google_sign_in(payload)
    start_new_session_for @user
    redirect_to accounts_path
  rescue Google::Auth::IDTokens::SignatureError, Google::Auth::IDTokens::AudienceMismatchError
    render json: { error: "Invalid Google OAuth2 token" }, status: :unauthorized
  end

  def logout
    @current_user.sessions.destroy_all
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def validate_google_csrf
    return if cookies["g_csrf_token"].present? && params["g_csrf_token"].present? && cookies["g_csrf_token"] == params["g_csrf_token"]

    raise ActionController::InvalidAuthenticityToken, "CSRF token mismatch"
  end

  def set_user_from_google_sign_in(payload)
    @user = User.find_by(email: payload["email"])
    if @user
      User.update(name: payload["name"])
    else
      User.create(email: payload["email"], name: payload["name"])
    end
  end
end
