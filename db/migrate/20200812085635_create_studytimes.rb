class CreateStudytimes < ActiveRecord::Migration[6.0]
  def change
    create_table :studytimes do |t|
      t.string :user_id
      t.integer :study_time
      t.date :study_date

      t.timestamps
    end
  end
end
