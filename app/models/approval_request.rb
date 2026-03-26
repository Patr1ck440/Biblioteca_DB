class ApprovalRequest < ApplicationRecord
  belongs_to :user
  belongs_to :loan

  validates :request_type, presence: true
  validates :status, inclusion: { in: %w[pending approved rejected] }
end