class SaleValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:sale_ts] << 'Need a past date please!' if record.sale_ts and record.sale_ts > Time.current
  end
end
