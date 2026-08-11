class AddDeadlineToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :deadline, :date
  end
end
