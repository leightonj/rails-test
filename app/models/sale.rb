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

class Sale < ActiveRecord::Base
  validates :sale_ts, presence: true
  validates :code,   presence: true, format: { with: /\A[A-Z]{2}\Z/ }
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1000000 }
  
  validates_with SaleValidator
  
  def date
    sale_ts.strftime('%Y%m%d')
  end
  
  def time
    sale_ts.strftime('%H%M')
  end
end
