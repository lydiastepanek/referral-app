class User < ActiveRecord::Base
  include Clearance::User
  has_many :referrals, :class_name => "User", :foreign_key => :referrer_id
  belongs_to :referrer, :class_name => "User", :foreign_key => :referrer_id

  def self.find_referrer(token)
    self.where(:email => token).first
  end

  def referral_link
    "/sign_up?refer_token=" + URI.escape(email)
  end
end
