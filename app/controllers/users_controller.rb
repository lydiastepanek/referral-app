class UsersController < Clearance::UsersController
  before_action :require_login, only: [:show]

  def create
    set_referrer
  end

  def show
  end

  private

  def set_referrer
    if params[:referToken]
      token = URI.unescape(params[:referToken]).html_safe
      user = User.find_referrer(token)
    end
  end
end
