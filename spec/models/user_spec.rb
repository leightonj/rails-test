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

require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  
  it 'is invalid without a username' do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
  end
  
  it 'is invalid without an already used username' do
    user = FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user, username: user.username)).not_to be_valid
  end
  
  it 'is invalid without a password_digest' do
    expect(FactoryGirl.build(:user, password_digest: nil)).not_to be_valid
  end
end
