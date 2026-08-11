class RemoveDeadlineFromUsers < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :deadline, :date
  end
end
