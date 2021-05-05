require 'rails_helper'
require 'spec_helper'

RSpec.describe Event, type: :model do
  it 'must have a name' do
    event = Event.new(date: Time.now, location: 'the beach', author_id: 1)
    expect(event).to_not be_valid
  end

  describe 'ActiveRecord associations' do
    it 'belongs to user' do
      expect { should belongs_to(user) }
    end
    it 'has many visitors' do
      expect { should has_many(attendees).dependent }
    end
    it ' has many attendees' do
      expect { should has_many(attendee).through }
    end
  end
end
