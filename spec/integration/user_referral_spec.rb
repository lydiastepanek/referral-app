require 'spec_helper'

RSpec.feature "user referral", :type => :feature do
  let!(:existing_user) { create(:user) }
  let!(:existing_user_referral_code) { Hashids.new.encode(existing_user.id) }

  context "when a new user signs up using an existing user's referral link" do
    before do
      visit "/sign_up?refer_code=" + existing_user_referral_code
      fill_in "Email", :with => "new_user@example.com"
      fill_in "Password", :with => "password"
      click_button "Sign up"
    end

    it "assigns the appropriate referrer" do
      expect(User.last.referrer).to eq(existing_user)
    end
  end
end
