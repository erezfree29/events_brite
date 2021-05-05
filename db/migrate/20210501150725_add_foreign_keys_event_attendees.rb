class AddForeignKeysEventAttendees < ActiveRecord::Migration[6.1]
  def change
    add_reference :event_attendees, :user, foreign_key: true
    add_reference :event_attendees, :event, foreign_key: true
  end
end
