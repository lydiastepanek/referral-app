require "spec_helper"

describe UsersController do
  let(:existing_user) { create(:user) }

  describe "#create" do
    it "redirects to root when user creation succeeds" do
      post :create, :user => { :email => "user@test.com", :password => "password" }
      is_expected.to redirect_to(root_url)
    end

    it "renders the new template when user creation fails" do
      post :create, :user => { :email => existing_user.email, :password => "password" }
      is_expected.to render_template("users/new")
    end
  end

  describe "#show" do
    it "redirects to login if the user has not logged in" do
      get :show, :user_id => existing_user.id
      is_expected.to redirect_to(sign_in_url)
    end

    it "renders the show template if the user has logged in" do
      get :show, :user_id => existing_user.id
      is_expected.to render_template(:show)
    end
  end
end
