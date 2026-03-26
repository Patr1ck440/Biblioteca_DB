class LoanLog < ApplicationRecord
  belongs_to :loan
  belongs_to :performed_by
end
