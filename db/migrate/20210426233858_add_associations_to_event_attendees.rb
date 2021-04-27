class AddAssociationsToEventAttendees < ActiveRecord::Migration[6.1]
  def change
    add_reference :event_attendees, :attendee, references: :users, foreign_key: {to_table: :users}
    add_reference :event_attendees, :attended_event, references: :users, foreign_key: {to_table: :events}
  end
end
