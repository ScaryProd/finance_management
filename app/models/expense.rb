class Expense < ApplicationRecord
  validates :total, presence: true
  validates :location, presence: true
  validates :user, presence: true

  belongs_to :user
end
