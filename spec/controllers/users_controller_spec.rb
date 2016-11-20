require "spec_helper"

describe UsersController, "POST #create" do
  let(:existing_user) { create(:user) }

  it "redirects to root on successful creation" do
    post :create, :user => { :email => "user@test.com", :password => "password" }

    is_expected.to redirect_to(root_url)
  end

  # context "successful post" do
    # it "assigns new user appropriate referrer" do
      # expect(User.last.referrer).to eq(existing_user)
    # end
  # end

  it "renders :new when user creation fails" do
    post :create, :user => { :email => existing_user.email, :password => "password" }

    is_expected.to render_template("users/new")
  end
end
