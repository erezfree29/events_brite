class Event < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :name, :date, :location, :author_id, presence: true
  scope :upcoming, -> { where('date >= ?', Time.zone.now) }
  scope :previous, -> { where('date < ?', Time.zone.now) }
end
