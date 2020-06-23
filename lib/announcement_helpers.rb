#
# Announcement helpers
#

module AnnouncementHelpers

  # fetch the current announcement
  def fetch_current_announcement
    if (!data.website.announcement.nil?)
      announcements = data.website.announcement.sort_by{ |id, e| e['_meta']['created_at'] }.reverse.select { |id, e| e.start_date <= DateTime.now && e.end_date >= DateTime.now }
      if (announcements.size > 0)
        return announcements.first
      end      
    end
    return nil
  end

end