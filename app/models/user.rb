# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  username              :string(255)
#  password_digest       :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  access_key            :string(255)
#  access_key_expires_at :datetime
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
  attr_accessor :password
  before_validation :set_password_digest
  
  def auth unencrypted_password
    BCrypt::Password.new(password_digest) == unencrypted_password
    begin
      self.access_key = SecureRandom.hex
    end while self.class.exists?(access_key: access_key)
    
    self.access_key_expires_at = Time.now + 3.days
    save
    self.access_key
  end
  
private
  def set_password_digest
    self.password_digest = BCrypt::Password.create(password, cost: BCrypt::Engine.cost) if password
  end
end
