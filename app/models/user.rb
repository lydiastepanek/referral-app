class User < ActiveRecord::Base
  include Clearance::User
  has_many :referrals, :class_name => "User", :foreign_key => :referrer_id
  belongs_to :referrer, :class_name => "User", :foreign_key => :referrer_id

  def self.find_referrer(refer_code)
    referrer_id = Hashids.new.decode(refer_code).first
    self.find(referrer_id)
  end

  def referral_code
    Hashids.new.encode(self.id)
  end
end
