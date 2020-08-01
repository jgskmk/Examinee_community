class AddUserImageName < ActiveRecord::Migration[6.0]
  def change
    add_column :user,:image_name,:string
  end
end
