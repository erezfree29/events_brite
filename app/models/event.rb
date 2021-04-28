class Event < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :attendees, through: :event_attendees, class_name: 'User', foreign_key: :user_id
  validates :name, :date, :location, :author_id, presence: true
  scope :upcoming, -> { where('date >= ?', Time.zone.now) }
  scope :previous, -> { where('date < ?', Time.zone.now) }
end
