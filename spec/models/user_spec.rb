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
  
  it 'saves password digest when sending password' do
    expect(FactoryGirl.build(:user_2)).to be_valid
  end
  
  it 'saves access_key and access_key_expires_at when authenticating' do
    user = FactoryGirl.create(:user_2)
    user.auth(user.password)
    expect(user.access_key).to_not be_nil
    expect(user.access_key_expires_at).to_not be_nil
  end
end
