class CreateStudytimes < ActiveRecord::Migration[6.0]
  def change
    create_table :studytimes do |t|
      t.string :user_id
      t.integer :hours
      t.integer :minutes
      t.date :date

      t.timestamps
    end
  end
end
