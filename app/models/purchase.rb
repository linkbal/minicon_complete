class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: [:complete, :cancelled]

  validates :user, :event, :status, :ticket_quantity, :total_price, presence: true
  validates :ticket_quantity, :total_price, numericality: { only_integer: true, greater_than: 0 }
  validate :ticket_quantity_enough

  def ticket_quantity_enough
    active_purchases = Purchase.complete.joins(:event).where(events: { id: event.id })
    errors.add(:base, 'This event is sold out.') if active_purchases.count + ticket_quantity > event.ticket_quantity
  end
end
