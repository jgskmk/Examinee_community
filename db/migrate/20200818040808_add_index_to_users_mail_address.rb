class AddIndexToUsersMailAddress < ActiveRecord::Migration[6.0]
  def change
  add_index :users, :mail_address, unique: true, length: 255
  end
end
