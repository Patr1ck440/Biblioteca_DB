class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :approval_requests
  has_many :loan_logs

  validates :loan_date, presence: true
  validates :due_date, presence: true
  validates :status, inclusion: { in: %w[pending active returned overdue] }
end