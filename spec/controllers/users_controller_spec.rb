require "spec_helper"

describe UsersController, "POST #create" do
  let(:referrer_user) { build(:user) }
  let(:referred_user) { build(:user) }

  before do
  end

  it "redirects to root when user is created" do
    post :create, :user => { :email => "user@test.com", :password => "password" }

    is_expected.to redirect_to(root_url)
  end

  it "assigns new user appropriate referrer based on params" do

  end

  it "renders :new when user creation fails" do
  end
end
