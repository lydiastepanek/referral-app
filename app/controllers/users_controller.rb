class UsersController < Clearance::UsersController
  before_action :require_login, only: [:show]

  def new
    session[:refer_token] = params[:refer_token] if params[:refer_token]
    super
  end

  def create
    @user = user_from_params
    set_referrer

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def show
  end

  private

  def set_referrer
    if session[:refer_token]
      token = URI.unescape(session[:refer_token]).html_safe
      referrer = User.find_referrer(token)
      @user.referrer = referrer
    end
  end
end
