class AddHoursCompletedToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :hours_completed, :integer
  end
end
