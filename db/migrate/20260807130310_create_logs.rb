class CreateLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :logs do |t|
      t.date :date_worked
      t.time :time_in
      t.time :time_out
      t.decimal :hours
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
