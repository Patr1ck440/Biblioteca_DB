class CreateLoanLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :loan_logs do |t|
      t.references :loan, null: false, foreign_key: true
      t.string :action
      t.bigint :performed_by_id, null: false
      t.timestamps
    end
    add_foreign_key :loan_logs, :users, column: :performed_by_id
  end
end