module UsersHelper
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

  def future_events_header
    if @future_events != nil
      content_tag(:h1) do
        ('future events')
      end
   end
  end

  def future_events
    if @future_events != nil
        content_tag_for(:h1, @future_events) do |event|
          content_tag(:h2) do
          ("#{@future_events.index(event) + 1})") +   
            ("#{event.name}") + ("to take place on ") + ("#{event.date}")
          end
        end   
    end
  end

  def created_events_header
    if @created_events != nil
      content_tag(:h1) do
        ('created events')
      end
   end
  end

  def created_events
    if @created_events != nil
        content_tag_for(:h1, @created_events) do |event|
          content_tag(:h2) do
            ("#{@created_events.index(event) + 1})") +   
            ("#{event.name}") + ("to take place on ") + ("#{event.date}")
          end
        end   
    end
  end
end










