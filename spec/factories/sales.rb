# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  sale_ts    :datetime
#  code       :string(255)
#  value      :decimal(10, 2)
#  created_at :datetime
#  updated_at :datetime
#

require 'faker'

FactoryGirl.define do
  factory :sale do
    sale_ts { Faker::Date.backward(7) }
    code { (0...2).map { (65 + rand(26)).chr }.join }
    value { Faker::Commerce.price }
  end

end
