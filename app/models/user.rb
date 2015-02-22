# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
  attr_accessor :password
  before_validation :set_password
  
private
  def set_password
    self.password_digest = BCrypt::Password.create(password, cost: BCrypt::Engine.cost) if password
  end
end