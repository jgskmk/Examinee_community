class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :image_name
      t.text :name
      t.text :mail_address

      t.timestamps
    end
  end
end
