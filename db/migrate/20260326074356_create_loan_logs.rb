class CreateLoanLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :loan_logs do |t|
      t.references :loan, null: false, foreign_key: true
      t.string :action
      t.references :performed_by, null: false, foreign_key: true

      t.timestamps
    end
  end
end
