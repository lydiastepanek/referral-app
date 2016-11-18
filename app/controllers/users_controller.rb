class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    check_for_referral
    @user = User.find(current_user.id)
    @referral_link = @user.email
  end

  private

  def check_for_referral
    @refer_token = params[:referToken] if params[:referToken]
  end
end
