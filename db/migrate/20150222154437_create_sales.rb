class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :sale_ts
      t.string :code
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
