class AddTotalHoursRequiredToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :total_hours_required, :integer
  end
end
