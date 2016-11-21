require "spec_helper"

describe User do
  subject { create(:user) }

  it { is_expected.to have_many :referrals }
  it { is_expected.to belong_to :referrer }

  describe "referral code" do
    it "encodes the user's id" do
      expected_code = Hashids.new.encode(subject.id)
      expect(subject.referral_code).to eq(expected_code)
    end
  end
end
