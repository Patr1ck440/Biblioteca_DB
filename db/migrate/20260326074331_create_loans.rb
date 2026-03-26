class CreateLoans < ActiveRecord::Migration[8.1]
  def change
    create_table :loans do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :loan_date
      t.date :due_date
      t.date :return_date
      t.string :status

      t.timestamps
    end
  end
end
