class AddMeetingsUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :user_id, :string
  end
end
