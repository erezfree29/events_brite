class User < ApplicationRecord
  validates :name, :email, presence: true
  validates_uniqueness_of :email
  has_many :created_events, class_name: 'Event', foreign_key: 'author_id'
  has_many :event_attendees, foreign_key: :user_id
  has_many :attended_events, through: :event_attendees
end
