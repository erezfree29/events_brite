require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it 'validates email and name' do
    user = User.new(email: '', name: '')
    expect(user.valid?).to be(false)
  end
  it 'validates  email and name' do
    user1 = User.new(email: 'andrei@gmail.com', name: 'Dan')
    expect(user1.valid?).to be(true)
  end
  describe 'ActiveRecord associations' do
    it 'has many created_events' do
      expect { should has_many(created_events) }
    end
    it 'has many visitors' do
      expect { should has_many(event_attendees).with_foreign_key }
    end
    it 'has many attended_events' do
      expect { should has_many(attended_events).through(event_attendees) }
    end
  end
end