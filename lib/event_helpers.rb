#
# Event helpers
#
module EventHelpers
    
  # fetches events that are coming up
  def filter_events(options = {})
    options = { featured: true }.merge(options)
    
    if (!data.website.event.nil?) 
      if (options[:featured])
        return data.website.event.select{|id, event| event.date_to >= DateTime.now }.sort_by{ |id, event| event.date_from }
      else
        return data.website.event.select{|id, event| event.date_to >= DateTime.now && !event.is_featured }.sort_by{ |id, event| event.date_from }
      end
    end
    return []
  end

  def next_featured_event
    if (!data.website.event.nil?) 
      events = data.website.event.select{|id, event| event.date_to >= DateTime.now && event.is_featured }.sort_by{ |id, event| event.date_from }
      return events.first.last if (events.size > 0)
    end
    return nil
  end
end