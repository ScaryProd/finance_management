class Expense < ApplicationRecord
  # Validates the expense creation in order to correctly create a new expense.
  validates :total, presence: true
  validates :location, presence: true
  validates :user, presence: true

  # belongs_to is a property that makes the expense model, literally, belong to a user.
  belongs_to :user
end
