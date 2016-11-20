class UsersController < Clearance::UsersController
  before_action :require_login, only: [:show]

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
    if params[:referToken]
      token = URI.unescape(params[:referToken]).html_safe
      referrer = User.find_referrer(token)
      @user.referrer = referrer
    end
  end
end
