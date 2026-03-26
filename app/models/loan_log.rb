class LoanLog < ApplicationRecord
  belongs_to :loan
  belongs_to :performed_by, class_name: 'User', foreign_key: 'performed_by_id'

  validates :action, presence: true
end