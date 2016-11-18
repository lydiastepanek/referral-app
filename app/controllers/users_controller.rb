class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @referral_link = 'LINKLINK'
  end
end
