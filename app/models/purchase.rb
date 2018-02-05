class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, :event, :status, :ticket_quantity, :total_price, presence: true
  validates :ticket_quantity, :total_price, numericality: { only_integer: true, greater_than: 0 }

  enum status: [:complete, :cancelled]
end
