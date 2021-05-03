module EventsHelper
  def show_attendees
    if @event.attendees != nil
      content_tag_for(:tr, @event.attendees) do |attendee|
        content_tag(:h2) do
          ("#{@event.attendees.index(attendee) + 1})") +   
          ("#{attendee.name}")
          end
      end
    end
  end

  def past_events_header
    if @past_events != nil
      content_tag(:h1) do
        ('past events')
      end
   end
  end

  def past_events
    if @past_events != nil
        content_tag_for(:tr, @past_events) do |event|
          content_tag(:h2) do
          ("#{@past_events.index(event) + 1})") +   
            ("#{event.name}") + ("to take place on ") + ("#{event.date}")
          end
        end   
    end
  end

  def upcoming_events_header
    if @upcoming_events != nil
      content_tag(:h1) do
        ('past events')
      end
   end
  end

  def upcoming_events
    if @upcoming_events != nil
        content_tag_for(:tr, @upcoming_events) do |event|
          content_tag(:h2) do
          ("#{@upcoming_events.index(event) + 1})") +   
            ("#{event.name}") + ("to take place on ") + ("#{event.date}")
          end
        end   
    end
  end


  def cancel
    if current_user.created_events.include?(@event)
      content_tag(:h3) do
        (link_to "cancel this event", event_path(@event),
        method: :delete,
        data: { confirm: "Are you sure?" })
      end
    end
  end
end



