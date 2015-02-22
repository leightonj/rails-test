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

require 'rails_helper'

RSpec.describe Sale, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:sale)).to be_valid
  end
  
  it 'is invalid without a present / past date' do
    expect(FactoryGirl.build(:sale, sale_ts: nil)).not_to be_valid
    expect(FactoryGirl.build(:sale, sale_ts: Time.current + 1.day )).not_to be_valid
  end
  
  it 'is invalid without a properly formated code' do
    expect(FactoryGirl.build(:sale, code: nil)).not_to be_valid
    expect(FactoryGirl.build(:sale, code: '3')).not_to be_valid
    expect(FactoryGirl.build(:sale, code: 'd')).not_to be_valid
    expect(FactoryGirl.build(:sale, code: 'gh')).not_to be_valid
    expect(FactoryGirl.build(:sale, code: 'z3')).not_to be_valid
    expect(FactoryGirl.build(:sale, code: '3z')).not_to be_valid
    expect(FactoryGirl.build(:sale, code: 'AAA')).not_to be_valid
  end
  
  it 'is invalid without a numerical value >=0 and < 1000000' do
    expect(FactoryGirl.build(:sale, value: nil)).not_to be_valid
    expect(FactoryGirl.build(:sale, value: '')).not_to be_valid
    expect(FactoryGirl.build(:sale, value: 'a')).not_to be_valid
    expect(FactoryGirl.build(:sale, value: '3.00a')).not_to be_valid
    expect(FactoryGirl.build(:sale, value: -0.01)).not_to be_valid
    expect(FactoryGirl.build(:sale, value: 1000000)).not_to be_valid
  end
end
