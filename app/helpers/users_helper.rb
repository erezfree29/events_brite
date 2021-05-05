module UsersHelper
  def past_events_header
    content_tag(:h1) { 'past events' } unless @past_events.nil?
  end

  def past_events
    content_tag_for(:h2, @past_events) do |event|
      "#{@past_events.index(event) + 1})#{event.name}to take place on #{event.date}" unless @past_events.nil?
    end
  end

  def future_events_header
    content_tag(:h1) do
      'future events' unless @future_events.nil?
    end
  end

  def future_events
    content_tag_for(:h2, @future_events) do |event|
      "#{@future_events.index(event) + 1})#{event.name}to take place on #{event.date}" unless @future_events.nil?
    end
  end

  def created_events_header
    content_tag(:h1) do
      'created events' unless @created_events.nil?
    end
  end

  def created_events
    content_tag_for(:h1, @created_events) do |event|
      "#{@created_events.index(event) + 1})#{event.name}to take place on #{event.date}" unless @created_events.nil?
    end
  end
end
