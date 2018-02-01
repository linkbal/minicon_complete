class EventCategory < ApplicationRecord
  has_many :events

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
