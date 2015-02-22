class AddAccessKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_key, :string
    add_column :users, :access_key_expires_at, :datetime
  end
end
