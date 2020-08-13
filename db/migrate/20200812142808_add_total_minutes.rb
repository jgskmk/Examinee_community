class AddTotalMinutes < ActiveRecord::Migration[6.0]
  def change
    add_column :studytimes, :total_minutes, :integer
  end
end
