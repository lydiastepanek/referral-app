class UsersController < Clearance::UsersController
  before_action :require_login, only: [:show]

  def new
    session[:refer_code] = params[:refer_code] if params[:refer_code]
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
    if session[:refer_code]
      refer_code = session[:refer_code]
      referrer = User.find_referrer(refer_code)
      @user.referrer = referrer
    end
  end
end
