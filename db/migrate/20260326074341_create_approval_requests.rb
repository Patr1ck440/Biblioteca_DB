class CreateApprovalRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :approval_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :loan, null: false, foreign_key: true
      t.string :request_type
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
