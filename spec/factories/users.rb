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

require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Internet.user_name }
    f.password_digest { Faker::Internet.password(8, 10) }
  end
  
  factory :user_2, class: User do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password(8, 10) }
  end
end
