require "spec_helper"

describe User do
  subject { build(:user, :email => "example@test.com") }

  it { is_expected.to have_many :referrals }
  it { is_expected.to belong_to :referrer }

  describe "referral link" do
    it "contains the user's referral code" do
      expect(subject.referral_link).to eq("/sign_up?refer_token=example@test.com")
    end
  end
end
