module EventsHelper
  def show_attendees
    content_tag_for(:h2, @event.attendees) do |attendee|
      "#{@event.attendees.index(attendee) + 1})" + attendee.name unless @event.attendees.nil?
    end
  end

  def past_events_header
    content_tag(:h1) do
      'past events' unless @past_events.nil?
    end
  end

  def past_events_index
    content_tag_for(:h2, @past_events) do |event|
      "#{@past_events.index(event) + 1})#{event.name}to take place on #{event.date}" unless @past_events.nil?
    end
  end

  def past_events_see
    content_tag_for(:h2, @past_events) do |event|
      link_to 'see event details', event_path(event) unless @past_events.nil?
    end
  end

  def upcoming_events_header
    content_tag(:h1) do
      'upcoming events' unless @upcoming_events.nil?
    end
  end

  def upcoming_events_index
    content_tag_for(:h2, @upcoming_events) do |event|
      "#{@upcoming_events.index(event) + 1})#{event.name}to take place on #{event.date}" unless @upcoming_events.nil?
    end
  end

  def upcoming_events_see
    content_tag_for(:h2, @upcoming_events) do |event|
      link_to 'see event details', event_path(event) unless @upcoming_events.nil?
    end
  end

  def upcoming_events_book
    content_tag_for(:h2, @upcoming_events) do |event|
      (link_to 'book', "/attend/#{event.id}", method: :post) unless @upcoming_events.nil?
    end
  end

  def cancel
    content_tag(:h3) do
      if current_user.created_events.include?(@event)
        (link_to 'cancel this event', event_path(@event),
                 method: :delete,
                 data: { confirm: 'Are you sure?' })
      end
    end
  end
end
