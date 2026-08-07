class CreateInternships < ActiveRecord::Migration[8.1]
  def change
    create_table :internships do |t|
      t.string :company_name
      t.string :role
      t.string :status
      t.date :date_applied
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
